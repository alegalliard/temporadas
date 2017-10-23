class AddFieldsToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :area, :integer
    add_column :properties, :description, :text
    add_column :properties, :minimum_rent_days, :integer
    add_column :properties, :maximum_rent_days, :integer
    add_column :properties, :maximum_occupancy, :integer
    add_column :properties, :usage_rules, :text
  end
end
