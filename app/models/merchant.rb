class Merchant < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  validates :name, presence: true
end
