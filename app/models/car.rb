class Car < ActiveRecord::Base
  belongs_to :user
  validates :brand, presence: true
  validates :model, presence: true
  validates :license, presence: true

  def description
    "#{brand.capitalize} #{model.capitalize} #{license.upcase}"
  end
end
