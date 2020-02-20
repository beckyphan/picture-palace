module UsersHelper

  def registration_errors(user)
    message = ""
    @user.errors.full_messages.each do |m|
      message += "<li class='error'> #{m} </li>"
    end
    return message
  end

end
