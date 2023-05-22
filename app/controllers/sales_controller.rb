# frozen_string_literal: true

class SalesController < ApplicationController
  def index # ok
    @sales = Sale.all
    render json: @sales
  end

  def create # needs update balance of seller | check logic of commission
    @sale = Sale.create(
      amount: params[:amount],
      transaction_type_id: params[:transaction_type_id],
      seller_id: params[:seller_id]
    )
    render json: @sale
  end

  def show # ok
    @sale = Sale.find(params[:id])
    render json: @sale
  end

  def update # update fields | needs yet update balance of seller | check logic of commission
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
end
