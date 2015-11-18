class Occurrence < ActiveRecord::Base
  belongs_to :event
  has_many :participants

  validates :event_id, presence: true
  validates :date, presence: true
  validates :time, presence: true


  def participate?(user)
    not participate(user).blank?
  end

  def participate(user)
    self.participants.where(user: user).first
  end

end
