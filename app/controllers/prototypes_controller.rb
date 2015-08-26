class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.page(params[:page]).per(8).includes(:user, :prototype_images, :tags)
  end

  def show
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    @prototype = Prototype.new(create_params)
    @prototype.tag_list.add("#{params[:prototype][:tag1]}", "#{params[:prototype][:tag2]}", "#{params[:prototype][:tag3]}")
    if @prototype.save
      redirect_to root_path
    else
      @prototype.prototype_images.build
      render 'new'
    end
  end

  private
  def create_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, prototype_images_attributes: [:name, :status]).merge(user_id: current_user.id)
  end

end
