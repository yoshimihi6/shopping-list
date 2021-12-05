class Item < ApplicationRecord
  belongs_to :store
  belongs_to :user

  validates :item_name, presence: true
  validates :price, presence: true
end
