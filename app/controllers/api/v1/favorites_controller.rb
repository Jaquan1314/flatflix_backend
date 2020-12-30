class Api::V1::FavoritesController < ApplicationController
  def index
    favorites = Favorite.all
    render json: favorites
  end

  def show
    favorite = Favorite.find(params[:id])
    render json: favorite
  end

  def destroy 
    favorite = Favorite.find(params[:id])
    favorite.destroy!
    render json: {}
  end
  
  def favorite_params
    params.permit(:user_id, :movie_id)
  end
end
