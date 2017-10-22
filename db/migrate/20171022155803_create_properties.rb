class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :property_location
      t.string :property_type
      t.integer :rooms
      t.decimal :daily_rate
      t.string :photo

      t.timestamps
    end
  end
end
