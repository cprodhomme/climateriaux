class Merchant < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  validate :name, presence: true
end
