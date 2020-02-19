class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      flash.now[:alert] = @user.errors.full_messages
      binding.pry
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
