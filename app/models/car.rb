class Car < ActiveRecord::Base
  belongs_to :user
  validates :brand, :model, presence: true

  def description
    "#{brand.capitalize} #{model.capitalize}"
  end
end
