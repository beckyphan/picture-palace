class GuestlistController < ApplicationController

  def create
    @attendees_event = AttendeesEvent.create(event_id: params[:event_id], attendee_id: current_user.id, status: true)
    flash.now[:notice] = "Your RSVP has been recorded."
    redirect_to event_path(params[:event_id])
  end

  def update
    @attendees_event = AttendeesEvent.find_by(event_id: params[:event_id], attendee_id: current_user.id)
    @attendees_event.update(status: false)
    flash.now[:notice] = "Your RSVP has been updated."
    redirect_to event_path(params[:event_id])
  end

  def destroy
  end
end
