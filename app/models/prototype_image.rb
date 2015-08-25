class PrototypeImage < ActiveRecord::Base
  belongs_to :prototype

  mount_uploader :image, ImageUploader

  validates_presence_of :image
end
