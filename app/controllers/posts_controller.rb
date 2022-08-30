class PostsController < ApplicationController
  def index
    @wedding = Wedding.find_by(user_id: params[:user_id])
    @user = User.find_by(params[:user_id])
  end

  def new
    @post = Post.new
    @user = User.find_by(params[:user_id])
  end

  def create
    @user = User.find_by(params[:user_id])
    @post = Post.new(post_params)
    if @post.save
      redirect_to action: :index, user_id: @user.id
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:attendance_id, :name, :name_kana, :category_id, :address, :mail, :departure,
      :go_home, :community, :message).merge(user_id: @user.id)
  end

end
