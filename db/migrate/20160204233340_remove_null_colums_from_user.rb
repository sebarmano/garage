class RemoveNullColumsFromUser < ActiveRecord::Migration
  def change
    change_column_null :users, :fname, true
    change_column_null :users, :lname, true
    change_column_null :users, :phone, true
  end
end
