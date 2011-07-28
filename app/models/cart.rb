# == Schema Information
# Schema version: 20110728163156
#
# Table name: carts
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  integer    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :user
  
  accepts_nested_attributes_for :line_items
  
  attr_accessible :bike_id, :name, :description, :size, :biketype, :price, :photo, :id, :address, :city, :state, :zip, :latitude, :longitude, :neighborhood 
  
  def total_price
    bikes.to_a.sum(&:price)
  end
  
end
