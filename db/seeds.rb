# frozen_string_literal: true

productor1 = Productor.create!(name: Faker::Name.name, email: Faker::Internet.email, balance: 0)

product1 = Product.create(name: 'Chicken', price: Faker::Number.number(digits: 4), productor_id: 1)
product2 = Product.create(name: 'Veggie', price: Faker::Number.number(digits: 4), productor_id: 1)
Product.create(name: 'Beef', price: Faker::Number.number(digits: 4), productor_id: 1)

affiliated1 = Affiliated.create!(name: Faker::Name.name, email: Faker::Internet.email, balance: 0, productor_id: 1)
Affiliated.create!(name: Faker::Name.name, email: Faker::Internet.email, balance: 0, productor_id: 1)

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

productor_affiliated = ProductorAffiliated.create!(productor_id: 1, affiliated_id: 1)

sale_item1 = SaleItem.create!(
  product_id: product1.id,
  quantity: 1
)
sale1 = Sale.create!(
  sale_item_id: sale_item1.id,
  amount: product1.price * sale_item1.quantity,
  transaction_type_id: transaction_type1.id,
  seller: productor1
)
Commission.create!(
  sale_id: sale1.id,
  transaction_type_id: sale1.transaction_type.id
)

sale_item2 = SaleItem.create!(
  product_id: product2.id,
  quantity: 1
)
sale2 = Sale.create!(
  sale_item_id: sale_item2.id,
  amount: product2.price * sale_item2.quantity,
  transaction_type_id: transaction_type2.id,
  productor_affiliated_id: productor_affiliated.id,
  seller: affiliated1
)
Commission.create!(
  sale_id: sale2.id,
  transaction_type_id: sale2.transaction_type.id
)
