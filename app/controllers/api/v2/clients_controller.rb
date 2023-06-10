# frozen_string_literal: true

module Api
  module V2
    # crud clients
    class ClientsController < ApplicationController
      def index
        clients = ClientReader.call(params)
        if @clients.present?
          render json: clients, status: :ok
        else
          render json: { error: 'Clients not found' }, status: :not_found
        end
      end

      def show
        client = ClientReader.call(params)
        if @client.present?
          render json: client, status: :ok
        else
          render json: { error: 'Client not found' }, status: :not_found
        end
      end

      def create
        client = ClientCreator.call(client_params)
        if client.save
          render json: client, status: :created
        else
          render json: client.errors, status: :unprocessable_entity
        end
      end

      def update
        client = ClientUpdater.call(params[:id], client_params)
        if client.update(client_params)
          render json: client, status: :ok
        else
          render json: client.errors, status: :unprocessable_entity
        end
      end

      def destroy
        client = ClientDestroyer.call(params[:id])
        if client.destroy
          render json: client, status: :ok
        else
          render json: client.errors, status: :unprocessable_entity
        end
      end

      private

      def client_params
        params.require(:client).permit(:name, :email, :balance, :password_digest)
      end
    end
  end
end
