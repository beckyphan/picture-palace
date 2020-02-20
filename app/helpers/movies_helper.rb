module MoviesHelper

  def new_movie_errors(movie)
    message = ""
    @movie.errors.full_messages.each do |m|
      message += "<li class='error'> #{m} </li>"
    end
    return message
  end

end
