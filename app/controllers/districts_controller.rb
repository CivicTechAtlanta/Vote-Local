class DistrictsController < ApplicationController
  def index
    #todo
  end

  def new
    #todo
  end

  def create
    District.create(district_params)
    redirect_to welcome_path
  end

  def show
    #todo
  end

  def edit
    #todo
  end

  def update
    #todo
  end

  def destroy
    #todo
  end

  private
    def district_params
      params.require(:name).permit(:type, :description)
    end
end
