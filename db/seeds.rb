# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

charlie = Admin.create({name: 'Charlie Kelly', email: 'charlie@bsmail.cc', password: 'alwayssunny'})
puts "Created User #{charlie.name}"
dennis = Admin.create({name: 'Dennis Reynolds', email: 'dennis@bsmail.cc', password: 'alwayssunny'})
puts "Created User #{dennis.name}"