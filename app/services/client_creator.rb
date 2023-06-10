# frozen_string_literal: true

class ClientCreator < ApplicationService
  def initialize(params)
    @params = params
  end

  def call
    create_client
  end

  private

  def create_client
    Client.create!(
      name: @params[:name],
      email: @params[:email],
      balance: @params[:balance],
      password_digest: @params[:password_digest]
    )
  rescue ActiveRecord::RecordNotUnique
    # handle duplicate entry
    Rails.logger.warn("Duplicate entry attempted: #{@params[:name]} - #{@params[:email]}")
  end
end
