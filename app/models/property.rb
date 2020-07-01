require 'elasticsearch/model'

class Property < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    settings index: { number_of_shards: 1 }

    belongs_to :user

    has_many :property_images, dependent: :destroy
    has_many :bookings, dependent: :destroy

    accepts_nested_attributes_for :property_images, allow_destroy: true

    def images
      # code
    end
end
