module EventsHelper

  def event_date(event)
     event.date_time.strftime("%m/%d/%Y")
  end

  def event_time(event)
    event.date_time.strftime("%I:%M %p")
  end

  def event_host(event)
    event.host.name
  end 

end
