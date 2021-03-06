class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash.now[:notice] = "Welcome #{@user.name}!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Errors on page. Please correct:"
      render 'new'
    end
  end

  # def edit
  # end
  #
  # def update
  # end

  def show
    @hosted_events = Event.host(current_user)
    @attending_events = Guestlist.attendee(current_user)

    @reviewed_movies = current_user.movies
  end

  # def destroy
  # end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

end
