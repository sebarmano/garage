class Appointment < ActiveRecord::Base
  belongs_to :car
  belongs_to :job
end
