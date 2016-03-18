class Job < ActiveRecord::Base
  belongs_to :job_type
  belongs_to :appointment
end
