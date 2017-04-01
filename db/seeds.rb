# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def get_random_player(players)
  players[rand(players.size)]
end

case Rails.env
  when 'development'
    players = []
    %w[
    yeoman.cai ned.loh joey.lin nasen.you
    samuel.huang vincent.cai lip.wang ian.zhang
    ].each do |name|
      player_params = {
          name: name,
          email: "#{name}@example.com",
          password: 'Test!123'
      }
      players.append Player.create(player_params)
    end


    (1..10).to_a.each do
      home_team = get_random_player(players)
      away_team = get_random_player(players)

      until away_team.id != home_team.id do
        away_team = get_random_player(players)
      end

      home_team_score = rand(1..5)
      if home_team_score === 5
        away_team_score = rand(1...5)
      else
        away_team_score = 5
      end

      match_params = {
          match_type: 'solo',
          home_team_id: home_team.id,
          away_team_id: away_team.id,
          home_team_score: home_team_score,
          away_team_score: away_team_score
      }
      match = Match.create(match_params)
      match.players.create(player: home_team)
      match.players.create(player: away_team)
    end

end

