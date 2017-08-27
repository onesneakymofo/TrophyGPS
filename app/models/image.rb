class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute

  validates :image, presence: true

end
