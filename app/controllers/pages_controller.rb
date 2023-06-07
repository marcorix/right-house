class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @header = ["Find your Happy", "Search properties for sale and to rent in the UK"]
    @city = request.location.city
    @country= request.location.country
    @longitude = request.location.longitude
    @latitude = request.location.latitude
  end

  def dashboard

  end
end
