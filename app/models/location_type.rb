class LocationType < ActiveRecord::Base
  has_many :location
  has_many :location_variation

  def book_count
    self.location.size
  end

end
