class AddStatusToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :status, :integer, default: 0, null: false
  end
end
