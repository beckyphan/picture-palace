module ReviewsHelper

  def new_review_errors(review)
    message = ""
    @review.errors.full_messages.each do |m|
      message += "<li class='error'> #{m} </li>"
    end
    return message.html_safe
  end

end
