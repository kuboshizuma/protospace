class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.page(params[:page]).includes(:user, :prototype_images, :tags)
  end

  def show
    @prototype = Prototype.find(params[:id])
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
