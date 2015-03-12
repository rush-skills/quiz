# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

#Create Admin
User.create!(name: "Admin", email: "admin@example.com", password: "12345678", password_confirmation: "12345678", role: 4)

#Create Categories
Category.create!(title: "Physics")
Category.create!(title: "Chemistry")
Category.create!(title: "Biology")
Category.create!(title: "Maths")

#Create Institutes
Institute.create!(name: "Test Institute 1")
10.times do
	Institute.create!(name: Faker::Lorem.sentence)
end

#Create Insti Admin
User.create!(name: "TestI1 Admin", email: "iadmin1@example.com", password: "12345678", password_confirmation: "12345678", role: 3, institute_id: 1)

#Add users to Institute 1
User.create!(name: "User 1", email: "user1@example.com", password: "12345678", password_confirmation: "12345678", role: 1, institute_id: 1)
20.times do
	User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678", role: 1, institute_id: 1)
end

#Add prof to Institute 1
p = User.create!(name: "Prof 1", email: "prof1@example.com", password: "12345678", password_confirmation: "12345678", role: 2, institute_id: 1)

#Create Tests
10.times do 
	t = Test.create!(title: Faker::Lorem.sentence, free: rand(0..1), category_id: Category.all.sample.id, user_id: p.id)
	#Add 5-25 questions to the test
	[5,10,15,20,25].sample.times do
		q = Question.create!(title: Faker::Lorem.sentence, test_id: t.id, description: Faker::Lorem.paragraph)
		#Add answers to each question
		rand(3..5).times do
			Answer.create!(question_id: q.id, text: Faker::Lorem.sentence, correct: rand(0..1))
		end
	end
end