# frozen_string_literal: true

class Api::V1::SalesController < ApplicationController
  def index
    @sales = Sale.all
    render json: @sales
  end

  def create
    sale = Sale.new(sale_params)
    seller = params[:seller_type].constantize.find(params[:seller_id])
    sale.seller = seller

    if sale.save
      update_seller_balance(sale)
      render json: sale, status: :created
    else
      render json: sale.errors, status: :unprocessable_entity
    end
  end

  def show
    @sale = Sale.find(params[:id])
    render json: @sale
  end

  # check logic of commission
  def update
    @sale = Sale.find(params[:id])
    @sale.update(
      transaction_type_id: params[:transaction_type_id],
      seller_id: params[:seller_id]
    )
    render json: @sale
  end

  private

  def sale_params
    params.permit(
      :sale_item_id,
      :productor_affiliated_id,
      :transaction_type_id
    )
  end

  def update_seller_balance(sale)
    if sale.transaction_type_id == 1
      seller = sale.seller
      sale_item = SaleItem.find(sale.sale_item_id)
      sale_item_product_id = sale_item[:product_id]
      sale_item_quantity = sale_item[:quantity]
      product = Product.find(sale_item_product_id)
      product_price = product[:price]
      total_product_price = product_price * sale_item_quantity
      seller.update!(balance: seller.balance + total_product_price)
    elsif sale.transaction_type_id == 2
      affiliated = sale.seller
      productor = affiliated.productor
      sale_item = SaleItem.find(sale.sale_item_id)
      sale_item_product_id = sale_item[:product_id]
      sale_item_quantity = sale_item[:quantity]
      product = Product.find(sale_item_product_id)
      product_price = product[:price]
      total_product_price = product_price * sale_item_quantity
      productor.update!(balance: productor.balance + total_product_price)
    elsif sale.transaction_type_id == 3
      sale_item = SaleItem.find(sale.sale_item_id)
      sale_item_product_id = sale_item[:product_id]
      sale_item_quantity = sale_item[:quantity]
      product = Product.find(sale_item_product_id)
      comission_value = product[:comission_value]
      total_comission_value = comission_value * sale_item_quantity
      sale.seller.update!(balance: sale.seller.balance + total_comission_value)
    elsif sale.transaction_type_id == 4
      affiliated = sale.seller
      productor = affiliated.productor
      sale_item = SaleItem.find(sale.sale_item_id)
      sale_item_product_id = sale_item[:product_id]
      product = Product.find(sale_item_product_id)
      sale_item_quantity = sale_item[:quantity]
      comission_value = product[:comission_value]
      total_comission_value = comission_value * sale_item_quantity
      productor.update!(balance: productor.balance - total_comission_value)
    end
  end
end
