class AttendeesEventsController < ApplicationController
  
  def create
    @attendees_event = AttendeeEvent.new
  end

  def update
    binding.pry
  end

  def destroy
  end
end
