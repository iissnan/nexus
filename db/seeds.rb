require 'json'
require 'date'
require 'Faker'
require_relative './migrator/users_map'
require_relative './migrator/migrator'

def migrate_from_rankade
  begin
    file_path = "#{File.dirname(__FILE__)}/migrator/rankadeMatchResult.json"
    f = File.read(file_path)
    matches = JSON.parse(f).reverse
    matches.slice(0..9).each do |match|
      Migrator.new match
    end
  rescue JSON::ParserError
    puts 'Parse match result file failed'
  end
end

case Rails.env
  when 'development'
    migrate_from_rankade
  else
    # pass
end

