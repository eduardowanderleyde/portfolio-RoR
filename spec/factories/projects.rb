FactoryBot.define do
  factory :project do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    technologies { Faker::ProgrammingLanguage.name }
    github_link { Faker::Internet.url }
    deploy_link { Faker::Internet.url }
    user
  end
end 