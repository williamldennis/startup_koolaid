require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end
  
  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should  have_selector('title', :content => "Contact")
  end
    
  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end
  
  it "should have a Sign In page at '/signin'" do
    get '/signin'
    response.should have_selector('title', :content => "Sign In")
  end
  
  it "should have a List your bike page at '/listyourbike'" do
    get '/listyourbike'
    response.should have_selector('title', :content => "List Your Bike")
  end
  
  it "should have a List your bike page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign Up")
  end
  
  it "should have a How it Works page at '/howitworks'" do
    get '/howitworks'
    response.should have_selector('title', :content => "How it Works")
  end
  
  it "should have a FAQ page at '/faq'" do
    get '/faq'
    response.should have_selector('title', :content => "FAQ")
  end
  
  it "should have the right links on the layout" do
    visit root_path
    response.should have_selector('title', :content => "Home")
    click_link "About"
    response.should have_selector('title', :content => "About")
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
    click_link "Sign In"
    response.should have_selector('title', :content => "Sign In")
    click_link "How it Works"
    response.should have_selector('title', :content => "How it Works")
    click_link "Home"
    response.should have_selector('title', :content => "Home")
    click_link "Sign Up"
    response.should have_selector('title', :content => "Sign Up")
    click_link "List Your Bike"
    response.should have_selector('title', :content => "List Your Bike")
    response.should have_selector('a[href="/"]>img')
  end
end
