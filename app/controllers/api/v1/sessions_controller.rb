# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      include JwtHelper

      def create_productor
        user = Productor.find_by(email: params[:email])
        if user&.authenticate(params[:password_digest])
          token = JWT.encode({ user_id: user.id }, jwt_secret_key, 'HS256', { exp: Time.now.to_i + 24 * 60 * 60 })
          render json: { token: }
        else
          render json: { error: 'Invalid login credentials' }, status: :unauthorized
        end
      end

      def create_affiliated
        user = Affiliated.find_by(email: params[:email])
        if user&.authenticate(params[:password_digest])
          token = JWT.encode({ user_id: user.id }, jwt_secret_key, 'HS256', { exp: Time.now.to_i + 24 * 60 * 60 })
          render json: { token: }
        else
          render json: { error: 'Invalid login credentials' }, status: :unauthorized
        end
      end

      def create_client
        user = Client.find_by(email: params[:email])
        if user&.authenticate(params[:password_digest])
          token = JWT.encode({ user_id: user.id }, jwt_secret_key, 'HS256', { exp: Time.now.to_i + 24 * 60 * 60 })
          render json: { token: }
        else
          render json: { error: 'Invalid login credentials' }, status: :unauthorized
        end
      end
    end
  end
end
