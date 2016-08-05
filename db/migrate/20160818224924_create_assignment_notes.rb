class CreateAssignmentNotes < ActiveRecord::Migration
  def change
    create_table :assignment_notes do |t|
      t.text :content, null: false
      t.references :assignment, index: true, foreign_key: true
      t.string :status
    end
  end
end
