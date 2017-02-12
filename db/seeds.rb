AdminUser.create(email: 'admin@test.com',
password: 'testing',
password_confirmation: 'testing',
first_name: 'Admin',
last_name: 'Ruler',
phone: "5555555555")

puts '1 admin user created'

@user = User.create(email: 'test@test.com',
                    password: 'testing',
                    password_confirmation: 'testing',
                    first_name: 'Jon',
                    last_name: 'Snow',
                    phone: "5555555555")
                    
puts '1 user created'


100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", overtime_request: 2.5, user_id: @user.id)
end

puts "100 Posts have been created!"

100.times do |audit_log|
  AuditLog.create!(user_id: User.last.id, status: 0, start_date: (Date.today - 6.days))
end

puts "100 Audit Logs have been created!"
