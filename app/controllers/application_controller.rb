# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_api!

  private

  def authenticate_api!
    api_key = request.headers['X-API-Key']
    return if api_key && api_key == ENV['API_KEY']

    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end
