class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def login
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif @user
      flash.now[:alert] = "Password incorrect. Please try again."
      render 'sessions/new'
    else
      flash.now[:alert] = "Email not found. Please try again."
      render 'sessions/new'
    end
  end

  def logout
    binding.pry
    reset_session
    redirect_to root_path
  end

end
