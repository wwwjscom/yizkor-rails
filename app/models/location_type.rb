class LocationType < ActiveRecord::Base
  has_many :location_variation
  has_many :location
  #LOCATIONS = LocationType.find(:all).collect { |l| [l.name, l.id] }
  LOCATIONS = ['Fix the lcoations model...', 1]
end
