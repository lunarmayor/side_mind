class AddSharedlistIdToListAssignments < ActiveRecord::Migration
  def change
    add_column :list_assignments, :sharedlist_id, :integer
  end
end
