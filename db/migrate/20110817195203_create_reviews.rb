class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :review_id
      t.string :the_review
      t.integer :bike_id
      t.integer :user_id
      t.timestamps
    end
  end


  def self.down
    drop_table :reviews
  end
end
