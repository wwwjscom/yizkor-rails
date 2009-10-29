class LocationVariation < ActiveRecord::Base
  belongs_to :location_type
  has_many :location

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

  # Return the books that are associated
  # with the location variation
  def books
    books = []
    self.location.each do |location|
      books << location.book
    end
    books
  end

  # Return the number of books that exist
  # for the given location variation
  def book_count
    #self.location_type.location.size
    self.location.size
  end
end
