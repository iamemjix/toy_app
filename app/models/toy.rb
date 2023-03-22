class Toy < ApplicationRecord
  belongs_to :user
  has_many :images

  validates :name, presence: :true
  validates :category, presence: :true
  validates :description, presence: :true
end

