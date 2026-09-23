class ApplicationController < ActionController::API

  #before_action :authenticate_user!

  attr_reader :current_user

  private

  def authenticate_user!

    header = request.headers["Authorization"]

    return unauthorized unless header.present?

    token = header.split(" ").last

    payload = JWT.decode(
      token,
      Rails.application.secret_key_base,
      true,
      algorithm: "HS256"
    ).first

    @current_user = User.find(payload["user_id"])

  rescue JWT::DecodeError
    unauthorized

  rescue JWT::ExpiredSignature
    unauthorized

  rescue ActiveRecord::RecordNotFound
    unauthorized
  end

  def unauthorized
    render json: {
      error: "Unauthorized"
    }, status: :unauthorized
  end

end