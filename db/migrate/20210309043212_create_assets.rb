class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.string :external_id
      t.string :base
      t.string :quote

      t.timestamps
    end
  end
end
