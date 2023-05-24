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
      amount: params[:amount],
      transaction_type_id: params[:transaction_type_id],
      seller_id: params[:seller_id]
    )
    render json: @sale
  end

  private

  def sale_params
    params.permit(
      :sale_item_id,
      :amount,
      :productor_affiliated_id,
      :transaction_type_id
    )
  end

  def update_seller_balance(sale)
    if sale.transaction_type_id == 1
      seller = sale.seller
      seller.update!(balance: seller.balance + sale.amount)
    elsif sale.transaction_type_id == 2
      affiliated = sale.seller
      productor = affiliated.productor
      productor.update!(balance: productor.balance + sale.amount)
    end
  end
end
