class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  USER_NAME, PASSWORD = "spinlisterbeta", "peertopeer"
  before_filter :authenticate
  
  filter_parameter_logging :card_number, :card_verification

  private
    def authenticate
      authenticate_or_request_with_http_basic do |user_name, password|
        user_name == USER_NAME && password == PASSWORD
      end
    end
    
    def current_cart
      Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end
end
