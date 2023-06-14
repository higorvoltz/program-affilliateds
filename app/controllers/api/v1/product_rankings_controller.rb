# frozen_string_literal: true

module Api
  module V1
    class ProductRankingsController < ApplicationController
      def index
        @product_rankings = ProductRanking.all
        if @product_rankings.present?
          render json: @product_rankings, status: :ok
        else
          render json: { error: 'ProductRankings not found' }, status: :not_found
        end
      end

      def show
        @product_ranking = ProductRanking.find(params[:id])
        if @product_ranking.present?
          render json: @product_ranking, status: :ok
        else
          render json: { error: 'ProductRanking not found' }, status: :not_found
        end
      end

      def create
        product_ranking = ProductRanking.new(product_ranking_params)
        if product_ranking.save
          render json: product_ranking, status: :created
        else
          render json: product_ranking.errors, status: :unprocessable_entity
        end
      end

      def update
        @product_ranking = ProductRanking.find(params[:id])
        if @product_ranking.present?
          @product_ranking.update(product_ranking_params)
          render json: @product_ranking, status: :ok
        else
          render json: { error: 'ProductRanking not found' }, status: :not_found
        end
      end

      def destroy
        @product_ranking = ProductRanking.find(params[:id])
        if @product_ranking.present?
          @product_ranking.destroy
          render json: @product_ranking, status: :ok
        else
          render json: { error: 'ProductRanking not found' }, status: :not_found
        end
      end

      private

      def product_ranking_params
        params.require(:product_ranking).permit(:ranking, :product_id, :client_id)
      end
    end
  end
end
