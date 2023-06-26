# frozen_string_literal: true

FactoryBot.define do
  factory :productor do
    name { Faker::Name.name}
    email { Faker::Internet.email }
    balance { Faker::Number.number(digits: 3) }
    password_digest { Faker::Internet.password }
  end
end
