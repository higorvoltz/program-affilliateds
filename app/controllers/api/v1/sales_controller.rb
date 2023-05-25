# frozen_string_literal: true

class Api::V1::SalesController < ApplicationController
  def index
    @sales = Sale.all
    if @sales.present?
      render json: @sales, status: :ok
    else
      render json: { error: 'Sales not found' }, status: :not_found
    end
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
    if @sale.present?
      render json: @sale, status: :ok
    else
      render json: { error: 'permissions not found' }, status: :not_found
    end
  end

  def update
    @sale = Sale.find(params[:id])
    @sale.update(sale_params)
    if @sale.present?
      update_seller_balance(sale)
      render json: @sale, status: :ok
    else
      render json: { error: 'permissions not found' }, status: :not_found
    end
  end

  private

  def sale_params
    params.permit(:sale_item_id, :productor_affiliated_id, :transaction_type_id)
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
