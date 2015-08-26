class Prototypes::NewestController < ApplicationController

  def index
    @prototypes = Prototype.order(updated_at: :desc).page(params[:page]).includes(:user, :prototype_images, :tags)
  end

end
