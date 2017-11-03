class Property < ApplicationRecord
  validates :title, :property_location, :property_type, :rooms, :daily_rate,
            :photo, :area, :description, :minimum_rent_days,
            :maximum_rent_days, :maximum_occupancy, :usage_rules,
             presence: {message: "Preencha todos os campos corretamente"}
end
