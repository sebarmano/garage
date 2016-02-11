class ChangeUserToCustomerInCar < ActiveRecord::Migration
  def change
    rename_column :cars, :user_id, :customer_id
  end
end
