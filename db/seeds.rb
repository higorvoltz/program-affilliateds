# frozen_string_literal: true

Productor.create!(name: Faker::Name.name, email: Faker::Internet.email, balance: 0)

product1 = Product.create(name: 'Chicken', price: Faker::Number.number(digits: 4), productor_id: 1)
Product.create(name: 'Veggie', price: Faker::Number.number(digits: 4), productor_id: 1)
Product.create(name: 'Beef', price: Faker::Number.number(digits: 4), productor_id: 1)

Affiliated.create!(name: Faker::Name.name, email: Faker::Internet.email, balance: 0, productor_id: 1)
Affiliated.create!(name: Faker::Name.name, email: Faker::Internet.email, balance: 0, productor_id: 1)

transaction_type1 = TransactionType.create!(
  type: 1,
  description: 'Venda produtor',
  nature: 'input',
  signal: '+'
)
TransactionType.create!(
  type: 2,
  description: 'Venda afiliado',
  nature: 'input',
  signal: '+'
)
TransactionType.create!(
  type: 3,
  description: 'Comissão paga',
  nature: 'output',
  signal: '-'
)
TransactionType.create!(
  type: 4,
  description: 'Comissão recebida',
  nature: 'input',
  signal: '+'
)

Sale.create!(
  product_id: product1.id,
  amount: product1.price,
  transaction_type_id: transaction_type1.id
)
