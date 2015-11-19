class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :occurrence

  validates :user_id, presence: true
  validates :occurrence_id, presence: true

  def self.search(search)
    if search
      self.where(:user_id => ["user_id == ?", "#{search}"])
    else
      self.all
    end
  end

end
