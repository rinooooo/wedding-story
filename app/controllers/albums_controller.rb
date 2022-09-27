class AlbumsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @wedding = @user.wedding
    @album = Album.new
    @albums = @user.album
    @images = @albums.images
  end

  def create
    @user = User.find(params[:user_id])
    @album = Album.new(album_params)
    @album.save
    redirect_to user_albums_path(@user.id)
  end

  private
  def album_params
    params.require(:album).permit(images: []).merge(user_id: @user.id)
  end
end
