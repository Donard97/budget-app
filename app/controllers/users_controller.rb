class UsersController < ApplicationController
  def index
    @user = User.all
  end
end
