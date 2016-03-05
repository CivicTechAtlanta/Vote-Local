class WelcomeController < ApplicationController
  def new
  end

  def index
    @geocoder = Geocoder.coordinates params['address']
  end
end
