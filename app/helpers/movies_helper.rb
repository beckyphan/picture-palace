module MoviesHelper

  def movie_rating_stars(num)
    message = ""
    num.times {message += "<img src='https://upload.wikimedia.org/wikipedia/commons/2/29/Gold_Star.svg' width='18px'>"}
    return message.html_safe
  end

end
