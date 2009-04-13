class Location < ActiveRecord::Base
  has_many :location_variation
  belongs_to :book
end
