class AddStartsAtToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :starts_at, :time, null: false
  end
end
