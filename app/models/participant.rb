class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :occurrence

  validates :user_id, presence: true
  validates :occurrence_id, presence: true
  validates :rating, numericality: { only_integer: true,
                                    :greater_than_or_equal_to =>0,
                                    :less_than_or_equal_to => 5 }

  def self.search(search)
    if search
      self.where(:user_id => ["user_id == ?", "#{search}"])
    else
      self.all
    end
  end

end
