class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if !params[:password].empty? && params[:password] != params[:password_confirmation]
      render json: { errors: 'The password confirmation does not match.' }, status: 409
    elsif user.save
      render json: UsersSerializer.new(user), status: 201
    else
      render json: { errors: user.errors.full_messages.first }, status: 400
    end
  end

  def user_params
    params.permit(:email, :password, :api_key)
  end
end
