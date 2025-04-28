FactoryBot.define do
  factory :experience do
    company { Faker::Company.name }
    role { Faker::Job.title }
    start_date { Faker::Date.between(from: 5.years.ago, to: Date.today) }
    end_date { Faker::Date.between(from: start_date, to: Date.today) }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
    user
  end
end 