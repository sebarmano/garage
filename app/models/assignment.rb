class Assignment < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :job_type
end
