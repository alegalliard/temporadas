class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end
  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:notice] = 'Imóvel cadastrado com sucesso!'
      redirect_to @property
    else
      render :new
    end
  end
  def show
    @property = Property.find(params[:id])
  end
  private
  def property_params
    params.require(:property).permit(:property_location, :area, :title,
                                  :description, :daily_rate, :rooms,
                                  :minimum_rent_days,
                                   :maximum_rent_days, :photo,
                                   :maximum_occupancy, :usage_rules,
                                   :property_type)
  end
end
