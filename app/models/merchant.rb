class Merchant < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  has_many :product_merchants
  validates :name, presence: true
end
