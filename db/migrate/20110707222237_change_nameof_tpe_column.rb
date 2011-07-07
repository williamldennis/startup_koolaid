class ChangeNameofTpeColumn < ActiveRecord::Migration
  def self.up
    rename_column :bikes, :type, :biketype
  end

  def self.down
    rename_column :bikes, :biketype, :type
  end
end
