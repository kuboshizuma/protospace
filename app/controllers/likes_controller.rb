class LikesController < ApplicationController
  def create
    like_status = params[:like_status]
    prototype_id = params[:prototype_id]
    all_count = Like.where(prototype_id: prototype_id).count
    if like_status == "true"
      like = Like.find_by(prototype_id: prototype_id, user_id: current_user.id)
      like.destroy
      render json: { all_count: all_count-1 }
    else
      Like.create(prototype_id: prototype_id, user_id: current_user.id)
      render json: { all_count: all_count+1 }
    end
  end
end
