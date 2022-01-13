class GroupsController < ApplicationController
  def index
    if user_signed_in?
      @group = current_user.groups
    else
      redirect_to user_session_path
    end
  end

  def new
    @group = Group.new
  end

  def show
    @payments = @group.payments.order(created_at: 'desc')
  end

  def create
    @group = current_user.groups.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_url, notice: 'Category was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.delete
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Category was successfully destroyed.' }
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end