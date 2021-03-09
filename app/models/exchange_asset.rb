class ExchangeAsset < ApplicationRecord
  belongs_to :exchange
  belongs_to :asset
end
