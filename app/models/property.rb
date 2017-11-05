class Property < ApplicationRecord
  validates :title, :property_location, :property_type, :rooms,
            :daily_rate, :photo, :area, :description,
            :minimum_rent_days, :maximum_rent_days,
            :maximum_occupancy, :usage_rules, presence: true

  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
