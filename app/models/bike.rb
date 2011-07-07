# == Schema Information
# Schema version: 20110707192016
#
# Table name: bikes
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  description        :text
#  size               :string(255)
#  type               :string(255)
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
  
  attr_accessible :name, :description, :size, :type, :price
  
  belongs_to :user
  
  default_scope :order => 'bikes.created_at DESC'
  
 
    
    # validates :name,        :presence => true, 
    #                         :length   => {:maximum => 50}
    # validates :description, :presence   => true,
    #                         :length   => {:maximum => 300}     
    # validates :size,        :presence => true,
    #                         :length => { :within => 3..40 }
    # validates :type,        :presence => true,
    #                         :length => { :within => 3..40 }
    # validates :price,       :presence => true,
    #                         :length => { :within => 1..10 }
end
