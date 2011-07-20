class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  USER_NAME, PASSWORD = "spinlisterbeta", "peertopeer"
  before_filter :authenticate

  private
    def authenticate
      authenticate_or_request_with_http_basic do |user_name, password|
        user_name == USER_NAME && password == PASSWORD
      end
    end
end
