class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :brand, null: false
      t.string :model, null: false
      t.string :color
      t.integer :year
      t.string :license
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
