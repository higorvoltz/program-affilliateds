# frozen_string_literal: true

productor1 = Productor.create!(name: 'JOSE CARLOS', email: 'jose_carlos@gmail.com', is_active: true, balance: 0, password: '123456')
productor2 = Productor.create!(name: 'ELIANA NOGUEIRA', email: 'eliana@gmail.com', is_active: true, balance: 0, password: '123456')
productor3 = Productor.create!(name: 'MARIA CANDIDA', email: 'candida@gmail.com', is_active: true, balance: 0, password: '123456')

product1 = Product.create(name: 'CURSO DE BEM-ESTAR ', price: 12_750, productor_id: productor1.id, ranking: 5, comission_value: 4_500)
product2 = Product.create(name: 'DOMINANDO INVESTIMENTOS', price: 50_000, productor_id: productor3.id, ranking: 4, comission_value: 16_500)
product3 = Product.create(name: 'DESENVOLVEDOR FULL STACK', price: 155_000, productor_id: productor2.id, ranking: 3, comission_value: 50_000)

affiliated1 = Affiliated.create!(name: 'THIAGO OLIVEIRA', email: 'thiago@gmail.com', is_active: true, balance: 0, productor_id: productor1.id, password: '123456')
affiliated2 = Affiliated.create!(name: 'CELSO DE MELO', email: 'celso@gmail.com', is_active: true, balance: 0, productor_id: productor2.id, password: '123456')
affiliated3 = Affiliated.create!(name: 'CARLOS BATISTA', email: 'carlos@gmail.com', is_active: true, balance: 0, productor_id: productor2.id, password: '123456')
affiliated4 = Affiliated.create!(name: 'CAROLINA MACHADO', email: 'carolina@gmail.com', is_active: true, balance: 0, productor_id: productor2.id, password: '123456')

ProductorAffiliated.create!(productor_id: productor1.id, affiliated_id: affiliated1.id)
ProductorAffiliated.create!(productor_id: productor2.id, affiliated_id: affiliated2.id)
ProductorAffiliated.create!(productor_id: productor2.id, affiliated_id: affiliated3.id)
ProductorAffiliated.create!(productor_id: productor2.id, affiliated_id: affiliated4.id)

TransactionType.create!(type: 1, description: 'Venda produtor', nature: 'input', signal: '+')
TransactionType.create!(type: 2, description: 'Venda afiliado', nature: 'input', signal: '+')
TransactionType.create!(type: 3, description: 'Comissão paga', nature: 'output', signal: '-')
TransactionType.create!(type: 4, description: 'Comissão recebida', nature: 'input', signal: '+')

SaleItem.create!(product_id: product1.id, quantity: 1)
SaleItem.create!(product_id: product2.id, quantity: 1)
SaleItem.create!(product_id: product3.id, quantity: 1)

Client.create!(name: 'CARLOS MIGUEL', email: 'carlos@gmail.com', balance: 99_999_999_999, password: '123456')
