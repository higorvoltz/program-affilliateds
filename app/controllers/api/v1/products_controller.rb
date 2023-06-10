# frozen_string_literal: true

module Api
  module V1
    # crud products
    class ProductsController < ApplicationController
      def index
        @products = Product.all
        if @products.present?
          render json: @products, status: :ok
        else
          render json: { error: 'Products not found' }, status: :not_found
        end
      end

      def create
        @product = Product.create!(product_params)
        if @product.present?
          render json: @product, status: :created
        else
          render json: { error: 'Unprocessable product' }, status: :unprocessable_entity
        end
      end

      def show
        @product = Product.find(params[:id])
        if @product.present?
          render json: @product, status: :ok
        else
          render json: { error: 'Product not found' }, status: :not_found
        end
      end

      def update
        @product = Product.find(params[:id])
        if @product.present?
          @product.update(product_params)
          render json: @product, status: :ok
        else
          render json: { error: 'Product not found' }, status: :not_found
        end
      end

      private

      def product_params
        params.require(:product).permit(:name, :price, :productor_id, :comission_value, :ranking)
      end
    end
  end
end
