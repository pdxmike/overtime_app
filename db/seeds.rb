@user = User.create(email: 'test@test.com', password: 'testing', password_confirmation: 'testing', first_name: 'Jon', last_name: 'Snow')
puts '1 user created'

AdminUser.create(email: 'admin@test.com', password: 'testing', password_confirmation: 'testing', first_name: 'Admin', last_name: 'Ruler')
puts '1 admin user created'

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created!"
