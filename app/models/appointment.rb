include ActionView::Helpers::DateHelper

class Appointment < ActiveRecord::Base
  belongs_to :car
  has_one :customer, through: :car
  has_one :user, through: :customer
  has_many :assignments, dependent: :destroy
  has_many :job_types, through: :assignments

  validates :car, presence: true, on: :regular
  validates :date_on, presence: true
  validates :starts_at, presence: true
  validate :presence_of_assignments

  accepts_nested_attributes_for :assignments,
                                allow_destroy: true
  before_save :set_duration
  before_save :set_status

  DEFAULT_DURATION = 2

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

  def self.active
    booked + confirmed
  end

  def self.ordered
    order('updated_at desc')
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

  def date_and_time
    "#{date_on} - " + time
  end

  def short_description
    time + " - " + customer.lname
  end

  private

  def presence_of_assignments
    errors.add(:assignments, "Can't be blank") if assignments == []
  end

  def set_duration
    self.duration ||= DEFAULT_DURATION
  end

  def set_status
    self.status = "uncompleted" unless car
  end
end
