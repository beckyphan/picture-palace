class GuestlistsController < ApplicationController

  def create
    @attendees_event = Guestlist.new(event_id: params[:event_id], attendee_id: current_user.id)

    if @attendees_event.save
      flash[:notice] = "Your RSVP has been recorded."
    else
      flash[:alert] = "Your RSVP cannot be recorded."
    end
    redirect_to event_path(params[:event_id])
  end

  def destroy
    @attendees_event = Guestlist.find_by(event_id: params[:event_id], attendee_id: current_user.id)
    @attendees_event.destroy
    flash[:notice] = "Your RSVP has been updated."
    redirect_to event_path(params[:event_id])
  end
end
