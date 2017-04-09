# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'Faker'

case Rails.env
  when 'development'
    foo = Player.create!(name: 'foo@example.com')
    foo.create_serial_number(number: '1234567890')
    bar = Player.create!(name: 'bar@example.com')
    bar.create_serial_number(number: '1234567891')

    30.times do
      name = Faker::Internet.user_name
      if Player.find_by_name(name)
        print "Found User: #{name}."
        player = Player.find_by_name(name)
      else
        print "Creat user: #{name}."
        params = { name: name, email: Faker::Internet.email }
        player = Player.create!(params)
      end

      if player.serial_number.nil?
        number = Faker::Number.number(10)
        puts "Serial number: #{number}"
        player.create_serial_number(number: number)
      end
    end
  else
    # pass
end

