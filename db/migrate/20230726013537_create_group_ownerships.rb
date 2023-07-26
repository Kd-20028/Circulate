class CreateGroupOwnerships < ActiveRecord::Migration[7.0]
  def change
    create_table :group_ownerships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
