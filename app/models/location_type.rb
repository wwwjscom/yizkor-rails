class LocationType < ActiveRecord::Base
  has_many :location_variation
  has_many :location

  def book_count
    self.location.size
  end

end
