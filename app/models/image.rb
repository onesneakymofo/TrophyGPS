class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true, validate: false

  include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute
end
