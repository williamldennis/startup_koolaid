# == Schema Information
# Schema version: 20110728153946
#
# Table name: orders
#
#  id              :integer         not null, primary key
#  cart_id         :integer
#  ip_address      :string(255)
#  last_name       :string(255)
#  card_type       :string(255)
#  card_expires_on :date
#  created_at      :datetime
#  updated_at      :datetime
#  first_name      :string(255)
#  billing_address :string(255)
#

class Order < ActiveRecord::Base
  attr_accessible :cart_id, :ip_address, :last_name, :card_type, :card_expires_on
  
  belongs_to :cart
  has_many :bikes
  
  attr_accessor :card_number, :card_verification
  
  validate_on_create :validate_card
  
  def purchase
      response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
      transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
      cart.update_attribute(:purchased_at, Time.now) if response.success?
      response.success?
  end

  def price_in_cents
    (cart.total_price*100).round
  end
  
  def validate_card
      unless credit_card.valid?
        credit_card.errors.full_messages.each do |message|
          errors.add_to_base message
        end
      end
    end

    def credit_card
      @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :type               => card_type,
        :number             => card_number,
        :verification_value => card_verification,
        :month              => card_expires_on.month,
        :year               => card_expires_on.year,
        :first_name         => first_name,
        :last_name          => last_name
      )
    end
  
end
