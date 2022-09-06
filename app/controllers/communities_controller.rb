class CommunitiesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @community = Community.new
    @wedding = @user.wedding
    @communities = @wedding.communities
  end

  def create
    @user = User.find(params[:user_id])
    @community = Community.new(community_params)
    @community.save
    @wedding = @user.wedding
    @communities = @wedding.communities
  end

  def destroy
    @user = User.find(params[:user_id])
    @wedding = @user.wedding
    @community = Community.find(params[:id])
    @community.destroy
    @communities = @wedding.communities
  end

  private
  def community_params
    params.require(:community).permit(:community_name).merge(wedding_id: @user.wedding.id)
  end
end
