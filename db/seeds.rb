# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ben = Admin.create({name: 'Ben Taitelbaum', email: 'ben@coshx.com', password: 'password'})
puts "Created User #{ben.name}"
mike = Admin.create({name: 'Mike Hickman', email: 'mike@coshx.com', password: 'password'})
puts "Created User #{mike.name}"
david = Admin.create({name: 'David Kovsky', email: 'david@coshx.com', password: 'password'})
puts "Created User #{david.name}"