class GuestlistsController < ApplicationController

  def create
    @attendees_event = Guestlist.create(event_id: params[:event_id], attendee_id: current_user.id, status: true)
    flash[:notice] = "Your RSVP has been recorded."
    redirect_to event_path(params[:event_id])
  end

  def update
    # move to destroy, edit event#show view accordingly
    @attendees_event = Guestlist.find_by(event_id: params[:event_id], attendee_id: current_user.id)
    @attendees_event.destroy
    flash[:notice] = "Your RSVP has been updated."
    redirect_to event_path(params[:event_id])
  end

  def destroy
  end
end
