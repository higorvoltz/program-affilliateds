# frozen_string_literal: true

class ClientDestroyer < ApplicationService
  def initialize(id)
    @id = id
  end

  def call
    destroy_client
  end

  private

  def destroy_client
    client = Client.find(@id)
    client.destroy!
    client
  end
end
