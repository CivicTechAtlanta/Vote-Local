class EventsController <ApplicationController
  def index
    #todo
  end

  def new
    #todo
  end

  def create
    District.find(params[:district_id]).events.create(event_params)
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
  def event_params
    params.require(:name).permit(:phone, :email)
  end
end