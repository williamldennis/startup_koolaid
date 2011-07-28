class AddingMoreInfotoOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :first_name, :string
    add_column :orders, :billing_address, :string
    
  end

  def self.down
    remove_column :orders, :first_name
    remove_column :orders, :billing_address
  end
end
