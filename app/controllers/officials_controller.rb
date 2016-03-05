class OfficialsController < ApplicationController
  def index
    #todo
  end

  def new
    #todo
  end

  def create
    District.find(params[:district_id]).officials.create(official_params)
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
  def official_params
    params.require(:name).permit(:phone, :email)
  end
end