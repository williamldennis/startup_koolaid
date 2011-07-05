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
  
  it "should have a Sign Up page at '/signup'" do
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
    # click_link "Home"
    # response.should have_selector('title', :content => "Home")
    click_link "Sign Up"
    response.should have_selector('title', :content => "Sign Up")
    click_link "List Your Bike"
    response.should have_selector('title', :content => "List Your Bike")
    response.should have_selector('a[href="/"]>img')
  end
  
  describe "when not signed in" do
    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                         :content => "Sign In")
    end
  end
  
  describe "when signed in" do
    
    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email,   :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end
    
    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "Sign Out")
    end
    
    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user),
                                         :content => "Profile")
    end
    
    it "should have a settings link" do
      visit root_path
      response.should have_selector("a", :href => edit_user_path(@user),
                                         :content => "Settings")
    end
    
    it "should have a Bike Owners link" do
      visit root_path
      response.should have_selector("a", :href => users_path,
                                         :content => "Bike Owners")
    end
  end
end

