# == Schema Information
# Schema version: 20110817195203
#
# Table name: bikes
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  description        :text
#  size               :string(255)
#  biketype           :string(255)
#  price              :decimal(, )
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  address            :string(255)
#  city               :string(255)
#  state              :string(255)
#  zip                :string(255)
#  latitude           :float
#  longitude          :float
#  neighborhood       :string(255)
#

class Bike < ActiveRecord::Base
  
  
  
  scope :road, where(:biketype=>'road')
  
  scope :biketype, lambda{ |biketype|  where(:biketype=>biketype) }
  
  
  has_attached_file :photo, :styles => { :small => "200X200>", 
                                         :medium => "300X300>", 
                                         :thumb => "100X100#", 
                                         :bigsquare => "300x300#",
                                         :large => "400x400>" },
                            :storage => :s3,
                            :bucket => 'Spinlister.dev.july11',
                            :s3_credentials => "#{Rails.root}/config/s3.yml", 
                            :url    => "/public/images/:id/:style/:basename.:extension",
                            :path   => "/public/images/:id/:style/:basename.:extension"
                                                                              
                           
  
  attr_accessible :name, :description, :size, :biketype, :price, :photo, :id, :address, :city, :state, :zip, :latitude, :longitude, :neighborhood, :bike_id, :reviews
                  
  BIKETYPES = [ 'Road', 'Mountain', 'Cruiser', 'Fixed Gear', 'Single Speed', 'Profesional Road', 'Professional Mountain', 'Unicycle', 'Tandem Bicycle', 'BMX', 'One of A Kind' ]
  
  after_validation :geocode, :if => :address_changed?
  
  geocoded_by :address
  
  belongs_to :user
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  
  default_scope :order => 'bikes.created_at DESC'
  

  validates :name,         :presence => true 
  validates :description,  :presence => true
  validates :size,         :presence => true
  validates :biketype,     :presence => true
  validates :price,        :presence => true 
  validates :user_id,      :presence => true
  validates :address,      :presence => true
  validates :neighborhood, :presence => true
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  # validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  def feed
    Bike.where("user_id = ?", id)
  end
  
  private
      
      def ensure_not_referenced_by_any_line_item
        if line_items.empty?
          return true
        else
          errors.add(:base, 'Line Items present')
          return false
        end
      end
  
end
