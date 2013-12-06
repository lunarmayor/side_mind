class RemoveListIdFromListAssignments < ActiveRecord::Migration
  def change
    remove_column :list_assignments, :list_id, :integer
  end
end
