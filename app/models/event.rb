class Event < ActiveRecord::Base
  belongs_to :user
  has_many :occurences, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :wishes, dependent: :destroy

  validates :user_id, presence: true
  validates :label, presence: true
  validates :description, presence: true
  validates :address, prensence: true
  validates :category, presence: true
end
