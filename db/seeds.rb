# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

test_user = User.create({name: 'test_user_name', email: 'test_user@gmail.com', title: 'test_user_title'})
test_itinerary = Itinerary.create({name: 'test_itinerary_name', user_id: '1', description: 'test_itinerary_description', start_datetime: DateTime.strptime('4/1/2015', '%m/%d/%Y'), end_datetime: DateTime.strptime('4/5/2015', '%m/%d/%Y')})