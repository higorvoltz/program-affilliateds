# frozen_string_literal: true

# froze_string_literlal: true

class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end

  def create
    @product = Product.create!(product_params)
    render json: @product
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    render json: @product
  end

  def destroy
    @products = Product.all
    @product = Product.find(params[:id])
    @product.destroy
    render json: @product
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :productor_id, :comission_value)
  end
end
