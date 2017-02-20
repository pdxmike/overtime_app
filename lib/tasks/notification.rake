namespace :notification do
  desc "Sends SMS notification to employees reminding them to log any overtime"
  task sms: :environment do
    # 1. Schedule to run every Sunday at 5pm
    # 2. Iterate over all employees
    # 3. Skip AdminUsers
    # 4. Send a message that has instructions and a link to log time
    ## Number Format: No spaces or dashes - Exactly 10 characters - All characters must be number
    # User.all.each do |user|
    #   SmsTool.send_sms(number: , message: )
    # end
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
