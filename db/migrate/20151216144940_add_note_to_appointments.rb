class AddNoteToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :note, :text
  end
end
