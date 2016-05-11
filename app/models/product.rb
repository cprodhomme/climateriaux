class Product < ActiveRecord::Base
  include Elasticsearch::Model
  
  belongs_to :category
  has_many :order_items
  has_many :product_images
  has_many :product_merchants
  has_many :technical_details
  default_scope { where(active: true) }
end
