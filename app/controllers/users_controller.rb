class UsersController < ApplicationController
  def show
    @user = User.first
  end

  def new
  end
end
