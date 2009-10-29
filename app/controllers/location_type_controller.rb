class LocationTypeController < ApplicationController
  def index
    @merged = Location.all_locations

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @location = LocationType.find(params[:id])
    @locations = @location.location
  end
end
