namespace :notification do
  desc "Sends SMS notification to employees reminding them to log any overtime"
  task sms: :environment do
    if Time.now.sunday?
      employees = Employee.all
      notification_message = "Please log into the OT Dashboard to log OT or confirm no OT was worked this week. https://pdxmike-overtime.herokuapp.com/"

      employees.each do |employee|
        SmsTool.send_sms(number: employee.phone, message: notification_message)
      end
    end
  end

  desc "Sends daily mail notification to managers (admin users) to inform of pending OT requests"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
    end
  end

end
