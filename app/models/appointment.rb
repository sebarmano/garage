include ActionView::Helpers::DateHelper

class Appointment < ActiveRecord::Base
  belongs_to :car
  belongs_to :job
  has_one :user, through: :car

  validates :car, presence: true
  validates :date_on, presence: true
  validates :duration, presence: true
  validates :starts_at, presence: true

  enum status: [:booked, :confirmed, :cancelled, :done]

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
    user.name
  end

  def booked_since
    time_ago_in_words(created_at)
  end
end
