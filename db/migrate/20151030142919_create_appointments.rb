class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :starts_at, null: false
      t.datetime :ends_at
      t.references :car, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
