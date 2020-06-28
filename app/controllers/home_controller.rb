class HomeController < ApplicationController
    def index
        @properties = Property.limit(3)
        @featured = @properties
    end

    def contact
        ContactMailer.with(name: params[:name], email: params[:email], phone: params[:phone], message: params[:message]).contact_email.deliver_now
    end
end
