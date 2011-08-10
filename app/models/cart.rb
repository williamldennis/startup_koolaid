# == Schema Information
# Schema version: 20110810153634
#
# Table name: carts
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  integer    :integer
#  created_at :datetime
#  updated_at :datetime
#  startdate  :datetime
#  enddate    :datetime
#  quantity   :integer
#

class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :user
  has_one :order
  
  accepts_nested_attributes_for :line_items
  
  attr_accessible :bike_id, :line_items, :name, :description, :size, :biketype, :price, :photo, :id, :address, :city, :state, :zip, :latitude, :longitude, :neighborhood, :startdate, :enddate 
  
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  
end
