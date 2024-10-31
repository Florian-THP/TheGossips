class CityController < ApplicationController
  def cityview
    @city = City.find(params[:id])
    @gossips = @city.gossips
  end
end
