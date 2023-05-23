# frozen_string_literal: true

class SalesController < ApplicationController
  def index # ok
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

  def update # check logic of commission
    @sale = Sale.find(params[:id])
    @sale.update(
      amount: params[:amount],
      transaction_type_id: params[:transaction_type_id],
      seller_id: params[:seller_id]
    )
    render json: @sale
  end

  def destroy # broken
    @sales = Sale.all
    @sale = Sale.find(params[:id])
    @sale.destroy
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

  def seller
    if transaction_type_id == 1
      @seller ||= Productor.find(seller_id).first
    end
  end

  def update_seller_balance(sale)
    if sale.transaction_type_id == 1 || sale.transaction_type_id == 2
      seller = sale.seller
      seller.update!(balance: seller.balance + sale.amount)
    end
  end
end
