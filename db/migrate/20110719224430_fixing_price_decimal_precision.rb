class FixingPriceDecimalPrecision < ActiveRecord::Migration
  def self.up
    def self.up
      add_column :bikes, :price, :decimal, :precision => 8, :scale => 2
    end

    def self.down
    end
  end
end
