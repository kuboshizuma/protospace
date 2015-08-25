class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def show
    @prototypes = Prototype.tagged_with(params[:id]).page(params[:params]).per(8)
  end

end
