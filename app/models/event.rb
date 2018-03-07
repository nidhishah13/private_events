class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :attendances, class_name: "Attendance", foreign_key: "attended_id"
  has_many :attendees, through: :attendances

  default_scope-> {order(created_at: :desc)}
  scope :upcoming, -> { where('event_date >= ?', Date.today) }
  scope :past, -> { where('event_date < ?', Date.today) }

  # def upcoming_events
  #   Event.where('event_date >= ?', Date.today)
  # end

  # def prev_events
  #   Event.where('event_date < ?', Date.today)
  # end
end
