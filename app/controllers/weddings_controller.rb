class WeddingsController < ApplicationController
  def edit
    @user = User.find(params[:user_id])
    @wedding = Wedding.find(params[:id])
  end

  def update
    @wedding = Wedding.find(params[:id])
  end
end
