class LocationVariationController < ApplicationController
  def index
    @location_variations = LocationVariation.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @location = LocationVariation.find(params[:id])
    @books = @location.books
  end
end
