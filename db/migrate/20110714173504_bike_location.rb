class BikeLocation < ActiveRecord::Migration
    def self.up
      add_column :bikes, :address, :string
      add_column :bikes, :city, :string
      add_column :bikes, :state, :string
      add_column :bikes, :zip, :string
    end

    def self.down
      remove_column :bikes, :address
      remove_column :bikes, :city
      remove_column :bikes, :state
      remove_column :bikes, :zip
    end
  end
