class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  def show
    user = User.find_by(id: session[:user_id])
    if user
      render json: user
    else
      render json: { error: 'Not authorized' }, status: :unauthorized
    end
  end
  def create 
    user=User.create(user_params)
    render json: {message: "User created successfully"}, status: :created

  end

  private

  def render_not_found
    render json: { error: 'user not found' }, status: :not_found
  end
  def user_params 
    params.permit(:username, :password)
  end
end
