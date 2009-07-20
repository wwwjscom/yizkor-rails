class LocationType < ActiveRecord::Base
  has_many :location_variation
  has_many :location
end
