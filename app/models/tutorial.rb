class Tutorial < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :name, :resume, :content, presence: true
end
