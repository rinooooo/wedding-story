class PostsController < ApplicationController
  

  def new
    @user = User.find(params[:user_id])
    @post_form = PostForm.new
    @wedding = @user.wedding
    @communities = @wedding.communities
  end

  def create
    @user = User.find(params[:user_id])
    @wedding = @user.wedding
    @communities = @wedding.communities
    # インスタンス生成
    @post_form = PostForm.new(post_form_params)
    tag_list = params[:post_form][:tag_name].split(",")
    # 新規登録
    binding.pry
    if @post_form.valid?
      @post_form.save(tag_list)
      redirect_to controller: :weddings, action: :index, user_id: @user.id
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
