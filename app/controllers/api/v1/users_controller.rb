class Api::V1::UsersController < ApplicationController

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
    user = User.create!(user_params)
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
    render json: {}
  end

  def login
    user = User.find_by(username: params[:username])
    if (user && user.authenticate(params[:password]))
      render json: user
    else
      render json: {errors: "Invalid credentials, please try again!"}
    end
  end

  private

  def user_params
    params.permit(:email, :username, :password)
  end
end # end User
