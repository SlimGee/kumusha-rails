class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
      @title = 'Properties'
      if params[:q]
          @properties = Elasticsearch::Model.search(params[:q]).records
          if params[:price]
              @properties = @properties.to_a.select do |prop|
                  prop.price.to_f <= params[:price].to_f
              end
          end
      else
          @properties = Property.all
      end
  end

  def show
      @title = @property.title
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end
end
