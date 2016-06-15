class ProductImage < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
