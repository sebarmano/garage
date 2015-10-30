class Job < ActiveRecord::Base
  belongs_to :type
  belongs_to :appointment
end
