include ActionView::Helpers::DateHelper

class Appointment < ActiveRecord::Base
  belongs_to :car
  has_one :customer, through: :car
  has_many :assignments
  has_many :job_types, through: :assignments

  validates :car, presence: true
  validates :date_on, presence: true
  validates :duration, presence: true
  validates :starts_at, presence: true

  accepts_nested_attributes_for :assignments,
                                allow_destroy: true

  enum status: [:booked, :confirmed, :cancelled, :done, :uncompleted]

  def self.list_for(date)
    where(date_on: date)
  end

  def self.times_for(date)
    list_for(date).pluck(:starts_at, :duration)
  end

  def self.reserved_hours_on(date)
    busy_hours = []
    times_for(date).each do |app|
      start_hour = app[0].hour
      end_hour = start_hour + app[1]
      busy_hours << Array(start_hour...end_hour)
    end
    busy_hours.flatten
  end

  def customer_name
    customer.name
  end

  def modified_since
    time_ago_in_words(updated_at)
  end

  def time
    starts_at.strftime("%H:%M")
  end
end
