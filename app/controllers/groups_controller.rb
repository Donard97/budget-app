class GroupsController < ApplicationController
  load_and_authorize_resource

  def index
    @groups = current_user.groups.order(:name)
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @payments = @group.payments.all
  end

  def create
    @group = current_user.groups.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to root_path, notice: 'Category was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Category was successfully destroyed.' }
    end
  end

  private

  def set_group
    @group = Group.includes(:payments).find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
