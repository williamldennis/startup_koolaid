class AddPriceToBike < ActiveRecord::Migration
  def self.up
    add_column :bikes, :price, :decimal
  end

  def self.down
    remove_column :bikes, :price
  end
end
