module FormHelper
  def setup_appointment(appointment)
    JobType.all.each do |job_type|
      appointment.assignments.build(job_type: job_type)
    end
    appointment
  end
end
