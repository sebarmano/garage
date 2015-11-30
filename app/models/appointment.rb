class Appointment < ActiveRecord::Base
  belongs_to :car
  belongs_to :job

  validates :car, presence: true
  validates :date_on, presence: true
  validates :duration, presence: true
  validates :starts_at, presence: true
end
