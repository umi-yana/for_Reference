class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: @post.id)
    favorite.save
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    favorite.destroy
    # redirect_back(fallback_location: root_path)
  end
end
