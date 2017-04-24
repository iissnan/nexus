require 'date'
require 'digest'
require_relative './users_map'

class Migrator
  def initialize(match_data)
    puts "Processing match #{match_data['number']}"

    match_scores = match_data['matchResult'].split('-')
    @match_data = match_data
    @match_time = @match_data['user_date']
    @match_winner = creat_team_from('winners_text')
    @match_loser = creat_team_from('loosers_text')
    @match_teams = [@match_winner, @match_loser]
    @match_winner_score = match_scores[0]
    @match_loser_score = match_scores[1]
    @match = create_match

    create_goals_of(@match_winner, @match_winner_score)
    create_goals_of(@match_loser, @match_loser_score)
    create_fights
    create_attendances
  end

  private

  def create_match
    puts '  Creating the match'
    Match.create!(
      team1_id: @match_winner.id,
      team2_id: @match_loser.id,
      created_at: get_match_time(@match_time),
      updated_at: get_match_time(@match_time)
    )
  end

  def creat_team_from(team)
    users = create_users_of(team)
    create_team_with(users)
  end

  def get_match_time(datetime)
    DateTime.parse("#{datetime}+0800")
  end

  def create_goals_of(team, score)
    time = get_match_time(@match_time) + rand(10 * 60)
    (0...score.to_i).to_a.each {
      create_goals(@match, team, time)
    }
  end

  def create_goals(match, team, time)
    match.goals.create!(
      match_id: match.id,
      team_id: team.id,
      score: 1,
      at: time
    )
  end

  def create_users_of(team)
    users = get_users_from(team)
    users.map { |username| create_user(username) }
  end

  def create_fights
    @match_teams.each do |team|
      @match.fights.find_or_create_by!(
        team_id: team.id,
        match_id: @match.id
      )
    end
  end

  def create_attendances
    @match_teams.each do |team|
      team.serial_numbers.each do |sn|
        @match.attendances.find_or_create_by!(
          match_id: @match.id,
          serial_number_id: sn.id
        )
      end
    end
  end

  def create_user(username)
    puts "  Creating user #{username}"
    user = User.find_or_create_by!(name: username) do |u|
      u.display_name = username.split('.').map { |str|
        str.capitalize
      }.join(' ')
      u.email = "#{username}@ringcentral.com"
    end
    generate_sn_for(user)
    user
  end

  def get_users_from(users_key)
    users = @match_data[users_key].split(',')
    users = users.map do |user|
      user = user.strip
      username = UsersMap.get(user)
      puts "Mapping #{user} -> None" if username.nil?
      username
    end
    users.compact
  end

  def generate_sn_for(user)
    if user.serial_number.nil?
      puts "  Creating serial number for #{user.name}"
      sn = Digest::SHA1.hexdigest(user.name)
      user.create_serial_number!(number: sn)
    end
  end

  def create_team_with(users)

    case users.size
    when 1
      puts "  Creating team for #{users[0].name}"
      sn = users[0].serial_number.number
      team = Team.create!(sn1: sn)
      create_contracts(sn, team)
    when 2
      puts "  Creating team for #{users[0].name} and #{users[1].name}"
      sn1 = users[0].serial_number
      sn2 = users[1].serial_number
      team = Team.create!(sn1: sn1.number, sn2: sn2.number)
      create_contracts(sn1, team)
      create_contracts(sn2, team)
    else
      team = nil
      puts 'Unexpected user length of a team'
    end
    team
  end

  def create_contracts(sn ,team)
    team.contracts.find_or_create_by!(
      serial_number_id: sn.id,
      team_id: team.id
    )
  end
end
