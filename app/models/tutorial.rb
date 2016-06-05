class Tutorial < ActiveRecord::Base
  before_validation :define_slug

  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :title, :resume, :content, presence: true

  private

  def define_slug
    return if self.slug.present?
    self.slug = self.id
  end
end
