# frozen_string_literal: true

module RequestsHelpers
  def json_body
    return parsed_body unless parsed_body.is_a?(Hash)

    ActiveSupport::HashWithIndifferentAccess.new(parsed_body)
  end

  private

  def parsed_body
    JSON.parse(response.body)
  end
end
