class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def new 
    user = User.new
    render json: user
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    
  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.permit(:email, :username, :password)
  end
end # end User
