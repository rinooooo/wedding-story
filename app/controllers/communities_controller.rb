class CommunitiesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @community = Community.new
    @communities = Community.all
  end

  def create
    @user = User.find(params[:user_id])
    @community = Community.new(community_params)
    @community.save
    @communities = Community.all
  end

  private
  def community_params
    params.require(:community).permit(:community_name).merge(wedding_id: @user.wedding.id)
  end
end
