class Image < ApplicationRecord
  belongs_to :toy

  validates :img, presence: {message: "Image can't be empty"}
  validates :img_id, presence: {message: "Image can't be empty"}
end
