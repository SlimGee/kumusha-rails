class BookingsController < ApplicationController
    def create
      @booking = property.bookings.new bookings_params
      if @booking.save
          respond_to do |format|
            format.html { redirect_to @property, notice: 'Appointment booked successfully' }
            format.json { render json: @booking }
          end
      end
    end

    private
        def set_property
          @property = Property.find(params[:property_id])
        end

        def bookings_params
          params.require(:booking).permit(:date, :name, :phone, :email)
        end
end
