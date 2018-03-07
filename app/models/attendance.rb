class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: "User", foreign_key: "attendee_id"
  belongs_to :attended, class_name: "Event", foreign_key: "attended_id"
  
  validates :attendee_id, presence: true
  validates :attended_id, presence: true
end
