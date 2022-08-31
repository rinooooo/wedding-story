class PostsController < ApplicationController
  def index
    @wedding = Wedding.find_by(user_id: params[:user_id])
    @user = User.find_by(params[:user_id])
  end

  def new
    @post_form = PostForm.new
    @user = User.find_by(params[:user_id])
  end

  def create
    @user = User.find_by(params[:user_id])
    # インスタンス生成
    @post_form = PostForm.new(post_form_params)
    # 新規登録
    if @post_form.valid?
      @post_form.save
      redirect_to action: :index, user_id: @user.id
    else
      render :new
    end
  end

  private
  def post_form_params
    params.require(:post_form).permit(:attendance, :name, :name_kana, :category_gloom, :category_bride, :address, :mail, :departure,
                                      :go_home, :message, :tag_name).merge(wedding_id: @user.wedding.id)
  end

end
