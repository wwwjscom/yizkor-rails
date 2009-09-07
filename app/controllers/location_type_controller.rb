class LocationTypeController < ApplicationController
  def index
    @location_types = LocationType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @location = LocationType.find(params[:id])
    @locations = @location.location
  end
end
