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

end
