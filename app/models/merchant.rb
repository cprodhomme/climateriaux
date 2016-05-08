class Merchant < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  has_many :product_merchants
  validate :name, presence: true
end
