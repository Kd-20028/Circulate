class AddApprovedToGroupMemberships < ActiveRecord::Migration[7.0]
  def change
    add_column :group_memberships, :approved, :boolean, default: false
  end
end
