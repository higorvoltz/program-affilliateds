# frozen_string_literal: true

module Api
  module V1
    # crud clients
    class ClientsController < ApplicationController
      def index
        @clients = Client.all
        if @clients.present?
          render json: @clients, status: :ok
        else
          render json: { error: 'Clients not found' }, status: :not_found
        end
      end

      def show
        @client = Client.find(params[:id])
        if @client.present?
          render json: @client, status: :ok
        else
          render json: { error: 'Clients not found' }, status: :not_found
        end
      end

      def create
        client = Client.new(client_params)
        if client.save
          render json: client, status: :created
        else
          render json: client.errors, status: :unprocessable_entity
        end
      end

      def update
        @client = Client.find(params[:id])
        if @client.present?
          @client.update(client_params)
          render json: @client, status: :ok
        else
          render json: { error: 'Clients not found' }, status: :not_found
        end
      end

      def destroy
        @client = Client.find(params[:id])
        if @client.present?
          @client.destroy
          render json: @client, status: :ok
        else
          render json: { error: 'Clients not found' }, status: :not_found
        end
      end

      # TODO include new action to update ranking of a product

      private

      def client_params
        params.require(:client).permit(:name, :email, :balance, :password_digest)
      end
    end
  end
end
