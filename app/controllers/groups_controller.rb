class GroupsController < ApplicationController
  def index
  if user_signed_in?
    @group = current_user.groups
  else
    redirect_to user_session_path
  end
end

  def show; end
end
