# frozen_string_literal: true

Product.create(name: 'Chicken', price: Faker::Number.number(digits: 4))
Product.create(name: 'Veggie', price: Faker::Number.number(digits: 4))
Product.create(name: 'Beef', price: Faker::Number.number(digits: 4))

Productor.create!(name: Faker::Name.name, email: Faker::Internet.email,
                  balance: Faker::Number.number(digits: 5))

Affiliated.create!(name: Faker::Name.name, email: Faker::Internet.email, balance: 0)
Affiliated.create!(name: Faker::Name.name, email: Faker::Internet.email, balance: 0)
