module Api
  module V1
    class SessionsController < ApplicationController


      def create
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
          token = generate_token(user)

          render json: {
            token: token,
            user_id: user.id,
            role: user.role,
            exp: 24.hours.from_now.to_i,    
            email: user.email,
            name: user.name
          }
        else
          render json: {
            error: "Invalid email or password"
          }, status: :unauthorized
        end
      end

      private

      def generate_token(user)
        payload = {
          user_id: user.id,
          role: user.role,
          exp: 24.hours.from_now.to_i,
            email: user.email,
            name: user.name
        }

        JWT.encode(
          payload,
          Rails.application.secret_key_base,
          "HS256"
        )
      end

    end
  end
end