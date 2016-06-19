class Category < ActiveRecord::Base
  has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent_category, :class_name => "Category"

  accepts_nested_attributes_for :subcategories

  def self.all_product category
    products = Product.where(category_id: category)
    subcategories = self.where(parent_id: category)
    subcategories.each do |subcategory|
      subproducts = Product.where(category_id: subcategory)
      if subproducts.present?
        subproducts.each do |p|
          products << p
        end
      end
    end
    return products
  end
end
