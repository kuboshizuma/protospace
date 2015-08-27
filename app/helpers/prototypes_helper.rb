module PrototypesHelper
  def simple_time(time)
    time.strftime("%b %d")
  end

  def main_image(prototype)
    prototype.prototype_images.main.first.name
  end
end
