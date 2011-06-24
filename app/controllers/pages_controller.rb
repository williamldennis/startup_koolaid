class PagesController < ApplicationController
  
  def home
    @title = "Home"
  end 

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def faq
    @title = "FAQ"
  end
  
  def signup
    @title = "Sign Up"
  end
  
  def signin
    @title = "Sign In"
  end
  
  def howitworks
    @title = "How it Works"
  end
  
  def listyourbike
    @title = "List Your Bike"
  end
end
