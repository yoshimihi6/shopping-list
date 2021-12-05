class Item < ApplicationRecord
  belongs_to :store
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true
  validates :price, presence: true
end
