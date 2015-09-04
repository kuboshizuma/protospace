class LikesController < ApplicationController
  def create
    prototype_id = params[:prototype_id]
    Like.create(prototype_id: prototype_id, user_id: current_user.id)
    all_count = Like.where(prototype_id: prototype_id).count
    render json: { all_count: all_count }
  end

  def destroy
    prototype_id = params[:id]
    like = Like.find_by(prototype_id: prototype_id, user_id: current_user.id)
    like.destroy
    all_count = Like.where(prototype_id: prototype_id).count
    render json: { all_count: all_count }
  end
end
