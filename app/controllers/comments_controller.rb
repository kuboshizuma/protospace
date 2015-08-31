class CommentsController < ApplicationController
  def create
    Comment.create(text: params[:comment][:text], prototype_id: params[:prototype_id], user_id: current_user.id)
    prototype = Prototype.find(params[:prototype_id])
    @comments = prototype.comments.includes(:user)
    @comment_count = @comments.count
  end
end
