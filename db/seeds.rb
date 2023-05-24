# frozen_string_literal: true

productor1 = Productor.create!(name: Faker::Name.name, email: Faker::Internet.email, balance: 0)
productor2 = Productor.create!(name: Faker::Name.name, email: Faker::Internet.email, balance: 0)

product1 = Product.create(
  name: Faker::ProgrammingLanguage.name,
  price: 10_000,
  productor_id: productor1.id,
  comission_value: 1000
)
product2 = Product.create(
  name: Faker::ProgrammingLanguage.name,
  price: 20_000,
  productor_id: productor1.id,
  comission_value: 2000
)
Product.create(
  name: Faker::ProgrammingLanguage.name,
  price: 150_000,
  productor_id: productor2.id,
  comission_value: 15_000
)

affiliated1 = Affiliated.create!(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  balance: 0,
  productor_id: productor1.id
)
affiliated2 = Affiliated.create!(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  balance: 0,
  productor_id: productor2.id
)

transaction_type1 = TransactionType.create!(
  type: 1,
  description: 'Venda produtor',
  nature: 'input',
  signal: '+'
)
transaction_type2 = TransactionType.create!(
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

ProductorAffiliated.create!(productor_id: productor1.id, affiliated_id: affiliated1.id)
productor_affiliated2 = ProductorAffiliated.create!(productor_id: productor2.id, affiliated_id: affiliated2.id)

sale_item1 = SaleItem.create!(
  product_id: product1.id,
  quantity: 1
)
Sale.create!(
  sale_item_id: sale_item1.id,
  transaction_type_id: transaction_type1.id,
  seller: productor1
)
productor1.update!(balance: product1.price)

sale_item2 = SaleItem.create!(
  product_id: product2.id,
  quantity: 1
)
Sale.create!(
  sale_item_id: sale_item2.id,
  transaction_type_id: transaction_type2.id,
  productor_affiliated_id: productor_affiliated2.id,
  seller: affiliated2
)
productor2.update!(balance: product2.price)
productor2.update!(balance: (product2.price + (product2.comission_value * -1)))
affiliated2.update!(balance: product2.comission_value)
