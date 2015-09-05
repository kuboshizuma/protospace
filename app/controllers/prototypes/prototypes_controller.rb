class Prototypes::PrototypesController < ApplicationController

  def index
    popular_ids = Prototype.joins('left join likes on prototypes.id = likes.prototype_id').group('prototypes.id').order('count_prototype_id desc').count('prototype_id').keys
    @prototypes = Prototype.where(id: popular_ids).includes(:user, :prototype_images, :tags).page(params[:page]).index_by(&:id).slice(*popular_ids).values
    @prototype_pagination = Prototype.where(id: popular_ids).page(params[:page])
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comments = @prototype.comments.includes(:user)
    @new_comment = @prototype.comments.build
    @comment_count = @comments.count
    @like_count = @prototype.likes.count
    @like_status = Like.exists?(prototype_id: params[:id], user_id: current_user.id)
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
      @prototype.prototype_images.build
      render 'new'
    end
  end

  private
  def create_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, tag_list: [], prototype_images_attributes: [:name, :status]).merge(user_id: current_user.id)
  end

end
