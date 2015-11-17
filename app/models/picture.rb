class Picture < ActiveRecord::Base
  belongs_to :event

  mount_uploader :picture, PictureUploader
end
