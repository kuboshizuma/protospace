class PrototypeImage < ActiveRecord::Base
  enum status: [ :main, :sub ]

  belongs_to :prototype

  mount_uploader :name, PrototypeImageUploader

  validates_presence_of :name
end
