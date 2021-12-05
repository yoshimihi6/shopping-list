FactoryBot.define do
  factory :user do
    name      {Faker::Name.name}
    email     {Faker::Internet.free_email}
    password              {"password1"}
    password_confirmation {"password1"}
  end
end