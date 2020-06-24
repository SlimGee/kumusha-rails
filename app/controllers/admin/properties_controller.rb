class Admin::PropertiesController < ApplicationController
    layout 'admin'
    before_action :authenticate_user!, only: [:create]
    before_action :set_property, only: [:destroy, :edit, :update]
    def index
      @properties = Property.all
    end

    def new
      @property = Property.new
    end

    def edit
    end

    def update
      respond_to do |format|
        if @property.update(property_params)
          format.html { redirect_to edit_admin_property_path @property, notice: 'Property was successfully updated.' }
          format.json { render :show, status: :ok, location: @property }
        else
          format.html { render :edit }
          format.json { render json: @property.errors, status: :unprocessable_entity }
        end
      end
    end

    def create
        @property = current_user.properties.new(property_params)

        respond_to do |format|
          if @property.save
              if params[:images]
                  params[:images].each do |img|
                      @property.property_images.create(image: img)
                  end
              end
            format.html { redirect_to @property, notice: 'Property was successfully created.' }
            format.json { render :show, status: :created, location: @property }
          else
            format.html { render :new }
            format.json { render json: @property.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
      @property.destroy
      respond_to do |format|
        format.html { redirect_to admin_properties_url, notice: 'Property was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_property
        @property = Property.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def property_params
        params.require(:property).permit(:user_id, :title, :address, :units, :bedrooms,
             :dinig_rooms, :kitchens, :yard, :rooms, :description, :status, :availability,
             :price, :city, :country)
      end
end
