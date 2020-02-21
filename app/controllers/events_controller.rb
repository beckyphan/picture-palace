class EventsController < ApplicationController

  def index
    @events = Event.all
    @event = Event.new
  end

  def create
    binding.pry
    @event = Event.new(event_params)
    @event.host_id = current_user.id

    if @event.save
      flash.now[:notice] = "Event Added!"
      redirect_to events_path
    else
      flash.now[:alert] = "Errors on page. Please correct:"
      render 'new'
    end
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:event_title, :date_time, :location, :movie_id)
  end
end
