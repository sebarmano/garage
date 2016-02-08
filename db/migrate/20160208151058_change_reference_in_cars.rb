class ChangeReferenceInCars < ActiveRecord::Migration
  def change
    remove_reference :cars, :customer, index: true, foreign_key: true
    add_reference :cars, :customer, index:true, foreign_key: true
  end
end
