class Renegadefig < ApplicationRecord

  validates :productName, presence: true
  has_one_attached :image

  #validates :price, presence: true
end
