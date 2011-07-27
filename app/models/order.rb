class Order < ActiveRecord::Base
  attr_accessible :cart_id, :ip_address, :last_name, :card_type, :card_expires_on
end
