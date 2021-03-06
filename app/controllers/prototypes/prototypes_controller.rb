class Prototypes::PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.order(like_count: :desc).page(params[:page])
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comments = @prototype.comments.includes(:user)
    @new_comment = @prototype.comments.build
    @comment_count = @comments.count
    @like_count = @prototype.likes.count
    @like_status = Like.exists?(prototype_id: params[:id], user_id: current_user.id) if user_signed_in?
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    @prototype = Prototype.new(create_params)
    if @prototype.save
      redirect_to root_path, notice: "プロトタイプを新規登録しました!"
    else
      @prototype.prototype_images.delete_all
      @prototype.prototype_images.build
      render 'new'
    end
  end

  private
  def create_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, tag_list: [], prototype_images_attributes: [:name, :status]).merge(user_id: current_user.id)
  end

end
