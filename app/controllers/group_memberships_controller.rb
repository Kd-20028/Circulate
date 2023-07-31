class GroupMembershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:create, :approve, :reject]

  def create
    @group_membership = @group.group_memberships.new(user: current_user)

    if @group_membership.save
      redirect_to @group, notice: 'Membership request sent. Waiting for approval.'
    else
      redirect_to @group, alert: 'Failed to request membership.'
    end
  end

  def approve
    @group_membership = @group.group_memberships.find(params[:id])
    @group_membership.update(approved: true)
    redirect_to @group, notice: 'Membership approved.'
  end

  def reject
    @group_membership = @group.group_memberships.find(params[:id])
    @group_membership.destroy
    redirect_to @group, notice: 'Membership rejected.'
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end
end
