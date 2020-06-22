class HomeController < ApplicationController
    def index
        @properties = Property.limit(3)
        @featured = @properties
    end
end
