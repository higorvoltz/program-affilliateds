# frozen_string_literal: true

module Api
  module V1
    # crud productors
    class ProductorsController < ApplicationController
      def index
        @productors = Productor.all
        if @productors.present?
          render json: @productors, status: :ok
        else
          render json: { error: 'Productors not found' }, status: :not_found
        end
      end

      def create
        @productor = Productor.create!(productor_params)
        if @productor.present?
          render json: @productor, status: :created
        else
          render json: { error: 'Unprocessable productor' }, status: :unprocessable_entity
        end
      end

      def show
        @productor = Productor.find(params[:id])
        if @productor.present?
          render json: @productor, status: :ok
        else
          render json: { error: 'Productor not found' }, status: :not_found
        end
      end

      def show_by_name
        @productor = Productor.find_by(name: params[:name])
        if @productor.present?
          render json: @productor, status: :ok
        else
          render json: { error: 'Productor not found' }, status: :not_found
        end
      end

      def update
        @productor = Productor.find(params[:id])
        if @productor.present?
          @productor.update(productor_params)
          render json: @productor, status: :ok
        else
          render json: { error: 'Productor not found' }, status: :not_found
        end
      end

      def destroy
        @productors = Productor.all
        @productor = Productor.find(params[:id])
        if @productor.present?
          @productor.destroy
          render json: @productors, status: :ok
        else
          render json: { error: 'Productor not found' }, status: :not_found
        end
      end

      private

      def productor_params
        params.require(:productor).permit(:name, :email, :balance, :password_digest).merge(is_active: true)
      end
    end
  end
end
