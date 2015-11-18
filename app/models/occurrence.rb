class Occurrence < ActiveRecord::Base
  belongs_to :event

  validates :event_id, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
