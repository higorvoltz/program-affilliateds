# frozen_string_literal: true

class SaleItemsController < ApplicationController
  def index
    @sale_items = SaleItem.all
    render json: @sale_items
  end

  def create
    @sale_item = SaleItem.new(sale_item_params)
    @sale_item.save
    render json: @sale_item
  end

  def show
    @sale_item = SaleItem.find(params[:id])
    render json: @sale_item
  end

  def update
    @sale_item = SaleItem.find(params[:id])
    @sale_item.update(sale_item_params)
    render json: @sale_item
  end

  private

  def sale_item_params
    params.permit(:product_id, :quantity)
  end
end
