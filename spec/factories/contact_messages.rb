FactoryBot.define do
  factory :contact_message do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    subject { Faker::Lorem.sentence }
    message { Faker::Lorem.paragraph_by_chars(number: 200) }
  end
end
