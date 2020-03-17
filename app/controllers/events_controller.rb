class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.upcoming
    @event = Event.new
  end

  def past
    @events = Event.past
    render 'past'
  end

  def create
    @event = Event.new(event_params)
    @event.host_id = current_user.id

    if @event.save
      flash[:notice] = "Event Added!"
      redirect_to events_path
    else
      flash.now[:alert] = "Errors on page. Please correct:"
      render 'new'
    end
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find_by_id(params[:id])

    if @event.host == current_user
      render 'edit'
    else
      flash[:alert] = "You are not authorized to edit this event!"
      redirect_to event_path(@event)
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
    @comments = @event.comments
    @comment = Comment.new

    @event.attendees.include?(current_user) ? @rsvp = true : @rsvp = false

    if Guestlist.find_by(event_id: params[:id], attendee_id: @current_user.id)
      @guest = Guestlist.find_by(event_id: params[:id], attendee_id: @current_user.id)
    else
      @guest = Guestlist.new
    end
  end

  def update
    @event = Event.find_by_id(params[:id])
    @event.update(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      flash.now[:alert] = "Errors on page. Please correct:"
      render 'edit'
    end
  end

  def destroy
    @event = Event.find_by_id(params[:id])
    @event.destroy
    flash[:notice] = "You've deleted your event."
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:event_title, :date_time, :location, :movie_id)
  end
end
