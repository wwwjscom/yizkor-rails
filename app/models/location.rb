class Location < ActiveRecord::Base
  belongs_to :book
  belongs_to :location_type
  belongs_to :location_variation

  def get_hash(loc_type_id)
    LocationType.find(loc_type_id)
  end
end
