class Removingphototable < ActiveRecord::Migration
  def self.up
    remove_column :bikes, :photo_file_name
    remove_column :bikes, :photo_content_type
    remove_column :bikes, :photo_file_size
    remove_column :bikes, :photo_updated_at
    remove_column :users, :photo_file_name
    remove_column :users, :photo_content_type
    remove_column :users, :photo_file_size
    remove_column :users, :photo_updated_at
  end

  def self.down
  end
end
