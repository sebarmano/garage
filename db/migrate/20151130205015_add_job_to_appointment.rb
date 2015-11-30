class AddJobToAppointment < ActiveRecord::Migration
  def change
    add_reference :appointments, :job, index: true, foreign_key: true
  end
end
