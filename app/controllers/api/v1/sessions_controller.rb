class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UsersSerializer.new(user)
    else
      render json: { errors: 'There was an error with your E-Mail/Password combination. Please try again.' },
             status: 400
    end
  end
end
