class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def login
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.omniauth
      flash.now[:alert] = "Please sign-in using Google."
      render 'sessions/new'
    elsif @user && @user.authenticate(params[:user][:password])
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

  def oauth_login
    user_info = request.env['omniauth.auth']

    @user = User.find_or_create_by(email: user_info['info']['email']) do |u|
      u.name = user_info['info']['name']
      u.username = user_info['info']['name'].gsub(/\s+/, "")
      u.password = ENV['DEFAULT_PASSWORD']
      u.omniauth = true
    end

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Please try again."
      render 'sessions/new'
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end

end
