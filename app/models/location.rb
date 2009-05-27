class Location < ActiveRecord::Base
  belongs_to :book
  belongs_to :location_type
end
