class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :cars
  has_many :appointments, through: :cars

  enum role: [:customer, :admin]

  def name
    "#{fname} #{lname}"
  end
end
