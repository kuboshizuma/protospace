class Prototype < ActiveRecord::Base
  acts_as_taggable

  has_many :prototype_images
  has_many :likes
  belongs_to :user

  accepts_nested_attributes_for :prototype_images, reject_if: :reject_image

  validates_presence_of :title, :catch_copy, :concept, :prototype_images

  paginates_per 8

  def reject_image(attributed)
    attributed[:name].blank?
  end

end
