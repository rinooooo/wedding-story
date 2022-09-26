class AlbumsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @wedding = @user.wedding
    @album = Album.new
    @albums = @user.album
  end

  def create
    @user = User.find(params[:user_id])
    binding.pry
    @album = Album.create(album_params)
    redirect_to user_albums_path(@user.id)
  end

  private
  def album_params
    params.require(:album).permit(:image).merge(user_id: @user.id)
  end
end
