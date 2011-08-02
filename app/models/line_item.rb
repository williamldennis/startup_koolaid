# == Schema Information
# Schema version: 20110728171748
#
# Table name: line_items
#
#  id         :integer         not null, primary key
#  bike_id    :integer
#  cart_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class LineItem < ActiveRecord::Base
  belongs_to :bike
  belongs_to :cart
  
  accepts_nested_attributes_for :bike, :cart
  
  attr_accessible :bike_id, :bike, :cart, :name, :description, :size, :biketype, :price, :photo, :id, :address, :city, :state, :zip, :latitude, :longitude, :neighborhood 
    
end
