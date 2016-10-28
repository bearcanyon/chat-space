class AddGroupIdToUsersGroups < ActiveRecord::Migration[5.0]
  def change
  	add_index :users_groups, [:user_id, :group_id]
  end
end
