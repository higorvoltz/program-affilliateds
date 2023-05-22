# frozen_string_literal: true

class ApplicationSerializer < ActiveModel::Serializer
  def helpers
    @helpers ||= ActionController::Base.helpers
  end
end
