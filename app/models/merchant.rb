class Merchant < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  has_many :inventories
  validates :name, presence: true
end
