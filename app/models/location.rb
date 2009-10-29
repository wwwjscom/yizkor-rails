class Location < ActiveRecord::Base
  belongs_to :book
  belongs_to :location_type
  belongs_to :location_variation

  def get_hash(loc_type_id)
    LocationType.find(loc_type_id)
  end

  # This method returns all locations,
  # mainly LocationType and LocationVariation
  def self.all_locations
    location_types = LocationType.find(:all)
    alternate_locations = LocationVariation.something

    # Merge the two arrays so that location variations
    # appear within the list of locations
    merged = alternate_locations | location_types                                                

    # Now sort them based on name
    merged.sort! { |x,y| x.name <=> y.name }
  end
end
