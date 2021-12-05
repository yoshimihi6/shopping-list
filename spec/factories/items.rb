FactoryBot.define do
  factory :item do
    item_name {'item'}
    price {'1000'}
    content {'test'}
    association :user
    association :store

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end