class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :appointment, index: true, foreign_key: true
      t.references :job_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
