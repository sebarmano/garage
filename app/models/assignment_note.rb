class AssignmentNote < ActiveRecord::Base
  belongs_to :assignment
  validates :content, presence: true
end
