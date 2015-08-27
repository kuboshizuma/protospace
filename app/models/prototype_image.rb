class PrototypeImage < ActiveRecord::Base
  self.inheritance_column = :_type_disabled
  belongs_to :prototype
  mount_uploader :image, ImageUploader
  validates_presence_of :image
end
