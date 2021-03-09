class Exchange < ApplicationRecord
  has_many :exchange_assets, dependent: :destroy
  has_many :assets, through: :exchange_assets

  validates :name, uniqueness: true, presence: true
end
