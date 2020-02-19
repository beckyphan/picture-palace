class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    params.inspect
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

end
