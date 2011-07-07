class AddUserIdToBike < ActiveRecord::Migration
  def self.up
    add_column :bikes, :user_id, :integer
  end

  def self.down
    remove_column :bikes, :user_id
  end
end
