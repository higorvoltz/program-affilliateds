# frozen_string_literal: true

class ClientReader < ApplicationService
  def initialize(params)
    @params = params
  end

  def call
    if @params[:id]
      find_client
    else
      list_clients
    end
  end

  private

  def find_client
    Client.find(@params[:id])
  end

  def list_clients
    Client.all
  end
end
