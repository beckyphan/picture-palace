class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def create
    @event = Event.new

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

end
