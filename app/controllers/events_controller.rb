class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
    @event = Event.new
  end

  def create
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
    @event = Event.find_by_id(params[:id])

    @event.attendees.include?(current_user) ? @rsvp = true : @rsvp = false

    if Guestlist.find_by(event_id: params[:id], attendee_id: @current_user.id)
      @guest = Guestlist.find_by(event_id: params[:id], attendee_id: @current_user.id)
    else
      @guest = Guestlist.new
    end

    @comments = Comment.all
    @comment = Comment.new
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
