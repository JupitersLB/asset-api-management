class CreateExchangeAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :exchange_assets do |t|
      t.references :exchange, null: false, foreign_key: true
      t.references :asset, null: false, foreign_key: true

      t.timestamps
    end
  end
end
