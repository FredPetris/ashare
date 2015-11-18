class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :occurrence

  validates :user_id, presence: true
  validates :occurrence_id, presence: true
end
