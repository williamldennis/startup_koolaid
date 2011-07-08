require 'spec_helper'

describe BikesController do
  render_views
  
  describe "access control" do
  
    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end
  
    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end
  
  describe "POST 'create'" do
    
    before(:each) do
      @user = test_sign_in(Factory(:user))
    end
    
    describe "failure" do
      
      before(:each) do
        @attr = { :name => " ",
                  :size => " ",
                  :description => " ",
                  :biketype => " ",
                  :price => " "}
      end 
      
      it "should not create a bike listing" do
        lambda do
          post :create, :bike => @attr
        end.should_not change(Bike, :count)
      end
      
      it "should re-render the list your bike page" do
        post :create, :bike => @attr
        response.should render_template('bikes/listyourbike')
      end
    end
    
    describe "success" do
      
      before(:each) do
        @attr = {  :name => "Sweet Ass Bike",
                  :size => "6 feet",
                  :description => " Ride her with respect. She's been good to me.",
                  :biketype => "Vintage Roadie ",
                  :price => "13.50"}
      end
      
      it "should create a bike listing" do
        lambda do
          post :create, :bike => @attr
        end.should change(Bike, :count).by(1)
      end
      
      it "should redirect to the profile page" do
        post :create, :bike => @attr
        response.should redirect_to(mybikes_path)
      end
      
      it "should have a flash success message" do
        post :create, :bike => @attr
        flash[:success].should =~ /your bike is listed!/i
      end
    end
  end
end
