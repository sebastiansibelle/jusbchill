# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create! :email => "sebastian@jusbchill.com", :password => "jusbadmin", :password_confirmation => 'jusbadmin'
user2 = User.create! :email => "andrewjosephgoddard@gmail.com", :password => "jusbadmin", :password_confirmation => 'jusbadmin'
user3 = User.create! :email => "aaron@jusbchill.com", :password => "jusbadmin", :password_confirmation => 'jusbadmin'
user4 = User.create! :email => "jacob@jusbchill.com", :password => "jusbadmin", :password_confirmation => 'jusbadmin'