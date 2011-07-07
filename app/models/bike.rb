# == Schema Information
# Schema version: 20110707222237
#
# Table name: bikes
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  description        :text
#  size               :string(255)
#  biketype           :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  price              :decimal(, )
#  user_id            :integer
#

class Bike < ActiveRecord::Base
  
  has_attached_file :photo
  
  attr_accessible :name, :description, :size, :biketype, :price
  
  belongs_to :user
  
  default_scope :order => 'bikes.created_at DESC'
  
  validates :name,        :presence => true 
  validates :description, :presence => true
  validates :size,        :presence => true
  validates :biketype,    :presence => true
  validates :price,       :presence => true
  validates :user_id,     :presence => true
  
  
end
