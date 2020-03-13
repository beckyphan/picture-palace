module ApplicationHelper

  def object_errors(instance)
    message = ""
    @instance.errors.full_messages.each do |i|
      message += "<li class='error'> #{i} </li>"
    end
    return message.html_safe
  end

end
