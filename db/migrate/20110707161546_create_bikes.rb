class CreateBikes < ActiveRecord::Migration
  def self.up
    create_table :bikes do |t|
      t.string   :name
      t.text     :description
      t.string   :size
      t.string   :type
      t.decimal  :price

      t.timestamps
    end
  end

  def self.down
    drop_table :bikes
  end
end
