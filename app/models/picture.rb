class Picture < ActiveRecord::Base
  belongs_to :event

  validates :event_id, presence: true
  validates :image_url, presence: true

  mount_uploader :image_url, PictureUploader
end
