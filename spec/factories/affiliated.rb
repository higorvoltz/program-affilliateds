# frozen_string_literal: true

FactoryBot.define do
  factory :affiliated do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    balance { Faker::Number.number(digits: 3) }
    productor_id { Faker::Number.between(from: 1, to: 10) }
    password_digest { Faker::Internet.password }
    productor
  end
end
