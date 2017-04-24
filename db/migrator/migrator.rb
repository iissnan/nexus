class Migrator
  def initialize(match)
    @match = match
    puts "[INFO] Process match #{match['number']}"
  end

  def users
    @users = []
    winners = @match['winners_text'].split(',')
    loosers = @match['loosers_text'].split(',')
    users = [].concat(winners).concat(loosers)

    users.each do |user|
      user = user.strip
      username = UsersMap.get(user)
      if username.nil?
        puts "    Mapping #{user} -> NONE"
      else
        @users.append username
      end
    end
    @users
  end

  def match_params
  end
end
