class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :merchant
  has_many :order_items
  has_many :product_images
  has_many :technical_details
  
  default_scope { where(active: true) }

  accepts_nested_attributes_for :product_images, 
                                reject_if: :all_blank,
                                allow_destroy: true
  accepts_nested_attributes_for :technical_details, 
                                reject_if: :all_blank,
                                allow_destroy: true

  validates :name, :slug, presence: true
end
