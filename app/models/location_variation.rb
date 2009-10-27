class LocationVariation < ActiveRecord::Base
  belongs_to :location_type

  # This method is a helper for displaying location
  # variations in a list.  It'll display the location
  # variation name, then in ()'s next to it the location
  # type its associated with.
  def self.something
    # OPTIMIZE: This method should be named to something useful
    x = self.find(:all)
    x.each { |y| y.name = "#{y.name} (#{y.location_type.name})" }
    return x.to_a
  end

  def book_count
    self.location_type.location.size
  end
end
