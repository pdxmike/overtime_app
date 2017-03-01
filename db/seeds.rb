AdminUser.create(email: 'admin@test.com',
								password: 'testing',
								password_confirmation: 'testing',
								first_name: 'Admin',
								last_name: 'Ruler',
								phone: "5555555555",
								ssn: 1234,
								company: 'ABC Company')

puts '1 admin user created'

@employee = Employee.create(email: 'test@test.com',
                    password: 'testing',
                    password_confirmation: 'testing',
                    first_name: 'Jon',
                    last_name: 'Snow',
                    phone: "5555555555",
										ssn: 1234,
										company: 'ABC Company')

puts '1 employee created'


AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 6.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 20.days))

puts "3 Audit Logs have been created!"

50.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that", daily_hours: 12.5, user_id: @employee.id)
end

puts "50 Posts have been created!"
