class Location < ActiveRecord::Base
  has_many :location_variation
  belongs_to :book
  LOCATIONS = Location.find(:all).collect { |l| [l.name, l.id] }
end
