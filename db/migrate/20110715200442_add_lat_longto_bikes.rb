class AddLatLongtoBikes < ActiveRecord::Migration
  def self.up
    add_column :bikes, :latitude, :float
    add_column :bikes, :longitude, :float
  end

  def self.down
     remove_column :bikes, :latitude
     remove_column :bikes, :longitude
  end
end
