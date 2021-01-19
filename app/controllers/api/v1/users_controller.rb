class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UsersSerializer.new(user), status: 201
    else
      render json: { errors: user.errors.full_messages.first }, status: 400
    end
  end

  def user_params
    params.permit(:email, :password, :api_key, :password_confirmation)
  end
end
