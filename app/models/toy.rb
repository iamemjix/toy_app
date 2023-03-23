class Toy < ApplicationRecord
  belongs_to :user
  has_many :images

  validates :name, presence: {message: "Name is empty."}
  validates :category, presence: {message: "Category is empty."}
  validates :description, presence: {message: "Description is empty."}
end

