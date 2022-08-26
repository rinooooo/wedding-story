class PostsController < ApplicationController
  def index
    @wedding = Wedding.find_by(user_id: params[:user_id])
    @user = User.find_by(params[:user_id])
  end

  def new
  end

  def create
  end

end
