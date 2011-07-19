class DecimalstoPriceChange < ActiveRecord::Migration
  def self.up
    remove_column :bikes, :price, :decimal, :scale => 2
  end

  def self.down
  end
end
