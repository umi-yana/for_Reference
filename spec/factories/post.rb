FactoryBot.define do
  factory :post do
    post_body { Faker::Lorem.characters(number:100) }
    select_a { Faker::Lorem.characters(number:100) }
  end
end