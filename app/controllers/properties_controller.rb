class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end
  def show
    @property = Property.find(params[:id])
  end
  def create
    @property = Property.new(property_params)
    @property.save
    redirect_to @property
    flash[:message] = 'Imóvel cadastrado com sucesso!'
  end

  private
  def property_params
    params.require(:property).permit(:title, :property_location, :property_type,
                                    :rooms, :daily_rate, :photo, :area,
                                    :description, :minimum_rent_days, :usage_rules,
                                    :maximum_rent_days, :maximum_occupancy)
  end
end
