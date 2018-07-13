FactoryBot.define do
  factory :user do
    username {Faker::Pokemon.name}
  end
end
