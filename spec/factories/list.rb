FactoryBot.define do
  factory :list do
    post_body { Faker::Lorem.characters(number:10) }
    select_a { Faker::Lorem.characters(number:30) }
  end
end