class WeddingsController < ApplicationController
  def index
    @wedding = Wedding.find_by(user_id: params[:user_id])
    @user = @wedding.user
    @communities = @wedding.communities
    @post_form = PostForm.new
  end
  
  def edit
    @user = User.find(params[:user_id])
    @wedding = @user.wedding
  end

  def update
    @user = User.find(params[:user_id])
    @wedding = @user.wedding
    if @wedding.valid?
      @wedding.update(wedding_params)
      redirect_to user_weddings_path(@user.id)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:user_id])
    @wedding = Wedding.find(params[:id])
    @posts = @wedding.posts
  end

  private
 
  def wedding_params
    params.require(:wedding).permit(:gloom_name, :bride_name, :gloom_name_en, :bride_name_en, :date, :answer_date, :message, :message_info, :location, :url, :address, :reception_time, :wedding_time, :photo_time, :party_time, :bye_time, :second_party_time)
  end
end
