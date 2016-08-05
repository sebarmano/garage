class Assignment < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :job_type
  has_many :assignment_notes
  delegate :car, to: :appointment
  delegate :customer, to: :appointment

  enum status: [:booked, :active, :in_progress, :cancelled, :complete]

  def job
    job_type.name
  end
end
