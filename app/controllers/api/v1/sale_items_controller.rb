# frozen_string_literal: true

module Api
  module V1
    # crud saleItems
    class SaleItemsController < ApplicationController
      def index
        @sale_items = SaleItem.all
        if @sale_items.present?
          render json: @sale_items, status: :ok
        else
          render json: { error: 'saleItems not found' }, status: :not_found
        end
      end

      def create
        @sale_item = SaleItem.new(sale_item_params)
        if @sale_item.present?
          @sale_item.save
          render json: @sale_item, status: :created
        else
          render json: { error: 'saleItem not found' }, status: :not_found
        end
      end

      def show
        @sale_item = SaleItem.find(params[:id])
        if @sale_item.present?
          render json: @sale_item, status: :ok
        else
          render json: { error: 'saleItem not found' }, status: :not_found
        end
      end

      def update
        @sale_item = SaleItem.find(params[:id])
        if @sale_item.present?
          @sale_item.update(sale_item_params)
          render json: @sale_item, status: :ok
        else
          render json: { error: 'saleItem not found' }, status: :not_found
        end
      end

      private

      def sale_item_params
        params.permit(:product_id, :quantity)
      end
    end
  end
end
