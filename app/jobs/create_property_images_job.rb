class CreatePropertyImagesJob < ApplicationJob
  queue_as :default

  def perform(property, image)
    property.property_images.create(image: image)
  end
end
