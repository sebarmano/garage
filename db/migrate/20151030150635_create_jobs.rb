class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :type, index: true, foreign_key: true
      t.references :appointment, index: true, foreign_key: true
      t.integer :status

      t.timestamps null: false
    end
  end
end
