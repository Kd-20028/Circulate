class DeleteGroupMemberships < ActiveRecord::Migration[7.0]
  def change
    drop_table :group_memberships

  end
end
