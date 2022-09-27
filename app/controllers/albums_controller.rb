class AlbumsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @wedding = @user.wedding
    @album = Album.new
    @albums = @user.albums
    if @albums != nil
      @images = []
      @albums.each do |album|
        all_images = album.images
        all_images.each do |image|
          @images.push(image)
        end
      end
    end
  end

  def create
    @user = User.find(params[:user_id])
    @album = Album.new(album_params)
    if @album.save
      redirect_to user_albums_path(@user.id)
    else
      render :index
    end
  end

  private
  def album_params
    params.require(:album).permit(images: []).merge(user_id: @user.id)
  end
end
