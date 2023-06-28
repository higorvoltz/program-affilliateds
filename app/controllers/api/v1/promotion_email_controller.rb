# frozen_string_literal: true

require 'sendgrid-ruby'

module Api
  module V1
    class PromotionEmailController < ApplicationController
      include SendGrid

      def send_email
        from = Email.new(email: email_params[:email_from])
        to = Email.new(email: email_params[:email_to])
        subject = email_params[:subject]
        content = Content.new(type: 'text/plain', value: email_params[:content])
        mail = Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        sg.client.mail._('send').post(request_body: mail.to_json)

        render json: { message: 'Email sent successfully' }
      end

      private

      def email_params
        params.require(:email).permit(:email_from, :email_to, :subject, :content)
      end
    end
  end
end
