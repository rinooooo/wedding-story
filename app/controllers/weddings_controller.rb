class WeddingsController < ApplicationController
  def edit
    @user = User.find(params[:user_id])
    @wedding = @user.wedding
  end

  def update
    @user = User.find(params[:user_id])
    @wedding = @user.wedding
    binding.pry
    if @wedding.valid?
      @wedding.update(wedding_params)
      redirect_to user_posts_path(@user.id)
    else
      render :edit
    end
  end

  private
 
  def wedding_params
    params.require(:wedding).permit(:gloom_name, :bride_name, :gloom_name_en, :bride_name_en, :date, :answer_date, :message, :message_info, :location, :url, :address, :reception_time, :wedding_time, :photo_time, :party_time, :bye_time, :second_party_time)
  end
end
