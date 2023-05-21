# frozen_string_literal: true

Productor.create!(name: Faker::Name.name, email: Faker::Internet.email,
                  balance: Faker::Number.number(digits: 5))

Product.create(name: 'Chicken', price: Faker::Number.number(digits: 4), productor_id: 1)
Product.create(name: 'Veggie', price: Faker::Number.number(digits: 4), productor_id: 1)
Product.create(name: 'Beef', price: Faker::Number.number(digits: 4), productor_id: 1)

Affiliated.create!(name: Faker::Name.name, email: Faker::Internet.email, balance: 0)
Affiliated.create!(name: Faker::Name.name, email: Faker::Internet.email, balance: 0)
