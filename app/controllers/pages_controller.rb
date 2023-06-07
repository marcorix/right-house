class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @header = ["Find your Happy", "Search properties for sale and to rent in the UK"]
    @city = request.location.city
  end

  def dashboard

  end
end
