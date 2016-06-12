class Tutorial < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :title, :resume, :content, :slug, presence: true

end
