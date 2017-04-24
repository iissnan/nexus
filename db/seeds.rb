require 'json'
require 'date'
require 'Faker'
require_relative './migrator/users_map'
require_relative './migrator/migrator'

def from_rankade
  begin
    f = File.read("#{File.dirname(__FILE__)}/migrator/rankadeMatchResult.json")
    matches = JSON.parse(f).reverse
    matches.each do |match|
      migrator = Migrator.new(match)

      # Creating Users
      migrator.users.each do |username|
        sn = Faker::Number.number(10)
        user = User.find_or_create_by!(name: username) do |u|
          u.email = "#{username}@ringcentral.com"
        end
        user.create_serial_number!(number: sn)
      end
    end
  rescue JSON::ParserError
    puts 'Parse match result file failed'
  end
end

def fake_data
  foo = User.create!(name: 'foo')
  foo.create_serial_number(number: '1234567890')
  bar = User.create!(name: 'bar')
  bar.create_serial_number(number: '1234567891')

  puts 'Generate Players and Serial Numbers.'
  30.times do
    name = Faker::Internet.user_name
    if User.find_by_name(name)
      print "Found User: #{name}."
      player = User.find_by_name(name)
    else
      print "Creat user: #{name}."
      params = { name: name, email: Faker::Internet.email }
      player = User.create!(params)
    end

    if player.serial_number.nil?
      number = Faker::Number.number(10)
      puts "Serial number: #{number}"
      player.create_serial_number(number: number)
    end
  end

  puts 'Generate couple teams.'
  30.times do
    sn1 = User.find(1 + (rand 30)).serial_number
    sn2 = User.find(1 + (rand 30)).serial_number

    until sn1 != sn2
      sn2 = User.find(1 + (rand 30)).serial_number
    end

    team = Team.create!({ sn1: sn1.number, sn2: sn2.number, sn1_position: 1, sn2_position: 0 })
    team.contracts.find_or_create_by!({ serial_number_id: sn1.id, team_id: team.id })
    team.contracts.find_or_create_by({ serial_number_id: sn2.id, team_id: team.id })

    print 'Team created: '
    print "  id : #{team.id}"
    print "  sn1: #{team.sn1}"
    print "  sn2: #{team.sn2}"
    puts ''
  end

  puts 'Generate solo teams.'
  30.times do
    sn1 = User.find(1 + (rand 30)).serial_number
    team = Team.create!({ sn1: sn1.number })
    team.contracts.find_or_create_by!({ serial_number_id: sn1.id, team_id: team.id })
    print 'Team created: '
    print "  id : #{team.id}"
    print "  sn1: #{team.sn1}"
    puts ''
  end

  puts 'Generate matches.'
  20.times do
    team1 = Team.find(1 + (rand 30))
    team2 = Team.find(1 + (rand 30))
    until team2.id != team1.id
      team2 = Team.find(1 + (rand 30))
    end

    match = Match.create!({ team1_id: team1.id, team2_id: team2.id })

    print 'Match created: '
    print "  id : #{match.id}"
    print "  team1: #{team1.id}"
    print "  team2: #{team2.id}"
    puts ''

    puts '  Adding Match and Team association'
    match.fights.find_or_create_by!({ team_id: team1.id, match_id: match.id })
    match.fights.find_or_create_by!({ team_id: team2.id, match_id: match.id })

    puts '  Adding Match and SerialNumber association'
    match.attendances.find_or_create_by!({
                                             match_id: match.id,
                                             serial_number_id: team1.serial_numbers[0].id
                                         })
    unless team1.serial_numbers[1].nil?
      match.attendances.find_or_create_by!({
                                               match_id: match.id,
                                               serial_number_id: team1.serial_numbers[1].id
                                           })
    end
    match.attendances.find_or_create_by!({
                                             match_id: match.id,
                                             serial_number_id: team2.serial_numbers[0].id
                                         })
    unless team1.serial_numbers[1].nil?
      match.attendances.find_or_create_by!({
                                               match_id: match.id,
                                               serial_number_id: team2.serial_numbers[1].id
                                           })
    end

    puts '  Creating Goals...'
    team1_score = 0
    team2_score = 0

    while team1_score < 5 and team2_score < 5
      if rand(2) === 0
        scoring_team = team1
        sn1 = team1.sn1
        sn2 = team1.sn2
        team1_score += 1
      else
        scoring_team = team2
        sn1 = team2.sn1
        sn2 = team2.sn2
        team2_score += 1
      end
      goal_params = {
          match_id: match.id,
          team_id: scoring_team.id,
          score: 1,
          sn1: sn1,
          sn2: sn2,
          at: Time.current + 30
      }
      goal = match.goals.create!(goal_params)
      print '  Goal created: '
      print "    id: #{goal.id}"
      print " team: #{scoring_team.id}"
      puts ''
    end
  end
end

case Rails.env
  when 'development'
    #from_rankade
    fake_data
  else
    # pass
end

