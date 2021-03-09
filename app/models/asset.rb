class Asset < ApplicationRecord
  has_many :exchange_assets, dependent: :destroy
  has_many :exchanges, through: :exchange_assets

  validates :external_id, uniqueness: true, presence: true

end
