class ChangeAppointmentsTable < ActiveRecord::Migration
  def change
    change_table :appointments do |t|
      t.remove :ends_at
      t.change :starts_at, :date
      t.rename :starts_at, :date_on
      t.integer :duration
      t.time :starts_at
    end
  end
end
