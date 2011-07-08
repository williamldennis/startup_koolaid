require 'spec_helper'

describe "Bikes" do

  before(:each) do
    user = Factory(:user)
    visit signin_path
    fill_in :email,    :with => user.email
    fill_in :password, :with => user.password
    click_button
  end
  
  describe "creation" do
    
    describe "failure" do
      
      it "should not make a new bike" do
        lambda do
          visit listyourbike_path
          fill_in :bike_name, :with => ""
          fill_in :bike_description, :with => ""
          fill_in :bike_size, :with => ""
          fill_in :bike_biketype, :with => ""
          fill_in :bike_price, :with => ""
          click_button
          response.should render_template('bikes/listyourbike')
          response.should have_selector('div#error_explanation')
        end.should_not change(Bike, :count)
      end
    end
    
    # describe "success" do
    #      it "should make a new micropost" do
    #        lambda do
    #          visit listyourbike_path
    #          fill_in :bike_name, :with => "f yeah bike name"
    #          fill_in :bike_description, :with => "best bike ever"
    #          fill_in :bike_size, :with => "im 6 feet"
    #          fill_in :bike_biketype, :with => "sweet ass cruiser"
    #          fill_in :bike_price, :with => "20.50"
    #          click_button
    #          response.should have_selector('span.name', :content => "f yeah bike name")
    #        end.should change(Bike, :count).by(1)
    #      end
    #    end
  end
          
  
end
