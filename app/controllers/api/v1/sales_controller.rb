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

  def update_seller_balance_for_sale(sale, amount)
    seller = sale.seller
    seller.update!(balance: seller.balance + amount)
  end

  def update_productor_balance_for_sale(sale, amount)
    affiliated = sale.seller
    productor = affiliated.productor
    productor.update!(balance: productor.balance + amount)
  end

  def update_affiliated_balance_for_sale(sale, amount)
    affiliated = sale.seller
    affiliated.update!(balance: affiliated.balance + amount)
  end

  def update_productor_balance_for_refund(sale, amount)
    affiliated = sale.seller
    productor = affiliated.productor
    productor.update!(balance: productor.balance - amount)
  end

  def update_seller_balance(sale)
    sale_item = SaleItem.find(sale.sale_item_id)
    product = Product.find(sale_item.product_id)

    case sale.transaction_type_id
    when 1
      update_seller_balance_for_sale(sale, product.price * sale_item.quantity)
    when 2
      update_productor_balance_for_sale(sale, product.price * sale_item.quantity)
    when 3
      update_affiliated_balance_for_sale(sale, product.comission_value * sale_item.quantity)
    when 4
      update_productor_balance_for_refund(sale, product.comission_value * sale_item.quantity)
    end
  end
end
