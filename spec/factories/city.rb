FactoryBot.define do
  factory :city do
  	sequence(:name) { |n| "Title#{n}" }

  end
end