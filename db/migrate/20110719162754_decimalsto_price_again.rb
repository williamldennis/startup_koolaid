class DecimalstoPriceAgain < ActiveRecord::Migration
  def self.up
    add_column :bikes, :price, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    remove_column :bikes, :price, :decimal
  end
end
