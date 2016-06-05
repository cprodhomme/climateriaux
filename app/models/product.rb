class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_items
  has_many :product_images
  has_many :inventories
  has_many :technical_details
  default_scope { where(active: true) }

  validates :name, presence: true
end
