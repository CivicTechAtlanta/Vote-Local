class WelcomeController < ApplicationController
  def new
  end

  def index
    @geocoder = params['address']
  end
end
