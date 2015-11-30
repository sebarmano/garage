class RenameStartsOnInAppointmentsTable < ActiveRecord::Migration
  def change
    rename_column :appointments, :starts_on, :date_on
  end
end
