class Property < ApplicationRecord
  belongs_to :user
  has_many :property_images
  accepts_nested_attributes_for :property_images, allow_destroy: true
end
