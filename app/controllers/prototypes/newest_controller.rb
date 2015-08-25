class Prototypes::NewestController < ApplicationController

  def index
    @prototypes = Prototype.order('updated_at DESC').page(params[:page]).per(8).includes(:user, :prototype_images, :tags)
  end

end
