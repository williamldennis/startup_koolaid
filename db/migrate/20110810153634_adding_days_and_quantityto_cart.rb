class AddingDaysAndQuantitytoCart < ActiveRecord::Migration
  def self.up
    add_column :carts, :startdate, :datetime
    add_column :carts, :enddate, :datetime
    add_column :carts, :quantity, :integer
  end

  def self.down
    add_column :carts, :startdate
    add_column :carts, :enddate
    add_column :carts, :quantity
  end
end
