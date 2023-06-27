module JwtHelper
  def jwt_secret_key
    Rails.application.secrets.secret_key_base
  end
end
