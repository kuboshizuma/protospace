class Prototype < ActiveRecord::Base
  acts_as_taggable
  has_many :prototype_images
  accepts_nested_attributes_for :prototype_images
  attr_reader :tag1, :tag2, :tag3
end
