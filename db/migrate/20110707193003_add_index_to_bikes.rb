class AddIndexToBikes < ActiveRecord::Migration
  def self.up
  end
  
  add_index(:bikes, :user_id)

  def self.down
  end
end
