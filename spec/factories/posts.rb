FactoryGirl.define do
  factory :post do
    date Date.today
    rationale 'Some Rationale'
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale 'Spandex Potatoes'
  end
end
