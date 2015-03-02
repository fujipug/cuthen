# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
test_user = Array.new(7)
test_other_user = Array.new(7)
for i in 0..6
	#test_other_user[i] = User.create({name: 'test_other_user_name' + i.to_s, email: 'test_other_user' + i.to_s + '@gmail.com', password: 'test_other_user' title: 'test_other_user' + i.to_s + '_title'})
end
for i in 0..6
	#test_user[i] = User.create({name: 'test_user_name' + i.to_s, email: 'test_user' + i.to_s + '@gmail.com', title: 'test_user' + i.to_s + '_title'})
end
User.create({name: 'moomoomamoo', email: 'moomoomamoo@gmail.com', password: '9meowFatpugs', sign_in_count: 0, title: 'cow tamer'})
User.create({email: 'mooomamoo@gmail.com', password: '9meowFatpugs', sign_in_count: 0, title: 'cow tamer'})
#test_user = User.create({name: 'test_user_name', email: 'test_user@gmail.com', title: 'test_user_title'})
test_itinerary = Itinerary.create({name: 'test_itinerary_name', user_id: '1', description: 'test_itinerary_description', start_datetime: DateTime.strptime('4/1/2015', '%m/%d/%Y'), end_datetime: DateTime.strptime('4/5/2015', '%m/%d/%Y')})