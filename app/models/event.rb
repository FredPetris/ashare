class Event < ActiveRecord::Base
  belongs_to :user
  has_many :occurrences, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :wishes, dependent: :destroy

  validates :user_id, presence: true
  validates :label, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :city, presence: true
  validates :place, :numericality => { :greater_than_or_equal_to => 0 }
  validates :participation, :numericality => { :greater_than_or_equal_to => 0 }

  def self.search(search, value)
    if search
      if search == "user_id"
        self.where(user_id: value.to_i)
      else
        self.where(:category => ["category LIKE ?", "#{search}"])
      end
    else
      self.all
    end
  end

end
