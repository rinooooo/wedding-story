class PostsController < ApplicationController
  def index
    @wedding = Wedding.find_by(user_id: params[:user_id])
  end
end
