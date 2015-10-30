class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :job_type, index: true, foreign_key: true
      t.references :appointment, index: true, foreign_key: true
      t.integer :status, null: false, default: 0

      t.timestamps null: false
    end
  end
end
