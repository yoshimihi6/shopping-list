class Store < ApplicationRecord
  has_many :store_users
  has_many :users, through: :store_users

  validates :store_name, presence: true
end
