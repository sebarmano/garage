class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :customer
  delegate :fname, to: :customer
  delegate :appointments, to: :customer

  enum role: [:regular, :admin]
  accepts_nested_attributes_for :customer
end
