class FollowsController < ApplicationController

  def create
    @follow = current_user.follows.new(follow_params)

    if !@follow.save
      flash[:notice] = @follow.errors.full_messages.to_sentence
    end
    redirect_to @follow.house
  end

  def destroy
    @follow = current_user.follows.find(params[:id])
    @follow.destroy
    redirect_to @follow.house
  end

  private

  def follow_params
    params.require(:follow).permit(:house_id)
  end
end
