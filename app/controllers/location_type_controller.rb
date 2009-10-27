class LocationTypeController < ApplicationController
  def index
    @location_types = LocationType.find(:all)
    @alternate_locations = LocationVariation.something

    # Merge the two arrays so that location variations
    # appear within the list of locations
    @merged = @alternate_locations | @location_types
    
    # Now sort them based on name
    @merged.sort! { |x,y| x.name <=> y.name }

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @location = LocationType.find(params[:id])
    @locations = @location.location
  end
end
