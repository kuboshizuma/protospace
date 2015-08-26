class Prototype < ActiveRecord::Base
  acts_as_taggable_on :tags

  has_many :prototype_images
  belongs_to :user

  accepts_nested_attributes_for :prototype_images, reject_if: :reject_image

  validates_presence_of :title, :catch_copy, :concept
  validate :must_have_one_captured_image

  paginates_per 8

  def reject_image(attributed)
    attributed[:name].blank?
  end

  def must_have_one_captured_image
    errors.add(:prprptype_images, "can't be blank") if prototype_images.empty?
  end

end
