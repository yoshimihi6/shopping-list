class Item < ApplicationRecord
  belongs_to :store
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true, unless: :was_attached?
  validates :price, numericality: { only_integer: true }

  def was_attached?
    self.image.attached?
  end
end
