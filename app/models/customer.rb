class Customer < ActiveRecord::Base
  has_one :user
  has_many :cars
  has_many :appointments, through: :cars

  validates :fname, presence: true
  validates :lname, presence: true

  accepts_nested_attributes_for :cars

  def name
    "#{fname} #{lname}"
  end
end
