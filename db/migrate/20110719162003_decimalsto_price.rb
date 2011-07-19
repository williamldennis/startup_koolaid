class DecimalstoPrice < ActiveRecord::Migration
  def self.up
    change_column :bikes, :price, :decimal, :scale => 2
  end

  def self.down
  end
end
