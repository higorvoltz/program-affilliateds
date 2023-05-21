# frozen_string_literal: true

product1 = Product.create(id: Faker::Internet.uuid, name: "Chicken", price: 1000)
product2 = Product.create(id: Faker::Internet.uuid, name: "Veggie", price: 2000)
product3 = Product.create(id: Faker::Internet.uuid, name: "Beef", price: 2000)
