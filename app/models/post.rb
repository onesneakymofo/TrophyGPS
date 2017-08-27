class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one :image, as: :imageable

  # validates :title, presence: true

  accepts_nested_attributes_for :image
end
