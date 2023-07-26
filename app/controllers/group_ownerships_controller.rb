class GroupOwnershipsController < ApplicationController
  before_action :set_group_ownership, only: [:show, :edit, :update, :destroy]

  def index
    @group_ownerships = GroupOwnership.all
  end

  def show
    # Retrieves the details of a specific group ownership record
  end

  def new
    @group_ownership = GroupOwnership.new
    # Prepare data for the form, if needed
  end

  def create
    @group_ownership = GroupOwnership.new(group_ownership_params)

    if @group_ownership.save
      redirect_to @group_ownership, notice: 'Group ownership was successfully created.'
    else
      render :new
    end
  end

  def edit
    # Prepare data for the edit form, if needed
  end

  def update
    if @group_ownership.update(group_ownership_params)
      redirect_to @group_ownership, notice: 'Group ownership was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group_ownership.destroy
    redirect_to group_ownerships_url, notice: 'Group ownership was successfully destroyed.'
  end

  private

  def set_group_ownership
    @group_ownership = GroupOwnership.find(params[:id])
  end

  def group_ownership_params
    params.require(:group_ownership).permit(:user_id, :group_id)
  end
end
