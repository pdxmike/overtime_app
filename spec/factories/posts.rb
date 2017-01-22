FactoryGirl.define do
  factory :post do
    date Date.today
    rationale 'Some Rationale'
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale 'super Potatoes'
    user
  end
end
