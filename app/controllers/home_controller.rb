class HomeController < ApplicationController
    def index
        @properties = Property.limit(3)
    end
end
