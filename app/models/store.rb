class Store < ApplicationRecord
  has_many :store_users, dependent: :destroy
  has_many :users, through: :store_users
  has_many :items, dependent: :destroy

  validates :store_name, presence: true
end
