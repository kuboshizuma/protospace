class PrototypesController < ApplicationController
  def new
    @prototype = Prototype.new
    4.times {@prototype.prototype_images.build}
  end

  def create
    @prototype = Prototype.new(create_params)
    @prototype.tag_list.add("#{params[:prototype][:tag1]}", "#{params[:prototype][:tag2]}", "#{params[:prototype][:tag3]}")
    if @prototype.save
      redirect_to root_path
    else
      3.times {@prototype.prototype_images.build}
      render 'new'
    end
  end

  private
  def create_params
    image_params = params.require(:prototype).require(:prototype_images_attributes)
    image_data = Hash.new
    image_data["0"] = image_params["0"].permit(:type, :image)
    image_params.delete("0")
    i=1
    image_params.each do |key, image|
      if image.keys.include?("image")
        image_data[i.to_s] = image.permit(:type, :image)
        i+=1
      end
    end
    params.require(:prototype).permit(:title, :catch_copy, :concept).merge(:prototype_images_attributes => image_data)
  end

end
