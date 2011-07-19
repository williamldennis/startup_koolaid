class NeighbordhoodtoBikeModel < ActiveRecord::Migration
  def self.up
    add_column :bikes, :neighborhood, :string
  end

  def self.down
    remove_column :bikes, :neighborhood
  end
end
