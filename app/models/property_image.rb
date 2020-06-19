class PropertyImage < ApplicationRecord
  belongs_to :property
  mount_uploader :image, PropertyImageUploader
end
