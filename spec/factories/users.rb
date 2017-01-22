FactoryGirl.define do
  factory :user do
    first_name 'Jon'
    last_name 'Snow'
    email 'test@test.com'
    password 'testing'
    password_confirmation 'testing'
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email 'admin@test.com'
    password 'testing'
    password_confirmation 'testing'
  end
end
