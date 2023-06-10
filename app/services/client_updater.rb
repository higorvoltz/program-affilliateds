# frozen_string_literal: true

class ClientUpdater < ApplicationService
  def initialize(id, params)
    @id = id
    @params = params
  end

  def call
    update_client
  end

  private

  def update_client
    client = Client.find(@id)
    client.update!(@params)
    client
  end
end
