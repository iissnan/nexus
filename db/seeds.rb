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
    foo = User.create!(name: 'foo@example.com')
    foo.create_serial_number(number: '1234567890')
    bar = User.create!(name: 'bar@example.com')
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

  else
    # pass
end

