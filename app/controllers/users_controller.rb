class UsersController < ApplicationController
  before_action :authenticate_user!, except: :new

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash.now[:notice] = "Welcome #{@user.name}!"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Errors on page. Please correct:"
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show

  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

end
