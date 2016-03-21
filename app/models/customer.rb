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

  def self.search(search)
    if search
      where("fname ILIKE ? OR  lname ILIKE ?", "%#{search}%",
            "%#{search}%").order("lname ASC")
    else
      all
    end
  end
end
