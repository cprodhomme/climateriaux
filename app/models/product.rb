class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_items
  has_many :product_medias

  default_scope { where(active: true) }
end
