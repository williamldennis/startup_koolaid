class ChangeLineItemProductIDtoBikeId < ActiveRecord::Migration
  def self.up
    rename_column :line_items, :product_id, :bike_id
  end

  def self.down
  end
end
