class JobType < ActiveRecord::Base
  has_many :assignments
  has_many :appointments, through: :assignments
end
