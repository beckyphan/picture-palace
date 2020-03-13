module MoviesHelper

  def new_movie_errors(movie)
    message = ""
    @movie.errors.full_messages.each do |m|
      message += "<li class='error'> #{m} </li>"
    end
    return message
  end

  def movie_rating_stars(num)
    message = ""
    num.times {message += "<img src='https://upload.wikimedia.org/wikipedia/commons/2/29/Gold_Star.svg' width='18px'>"}
    return message
  end

end
