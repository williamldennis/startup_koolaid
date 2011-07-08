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
  
  describe "DELETE 'destroy'" do
    
    describe "for an unautorized user" do
      
      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        @bike = Factory(:bike, :user => @user)
        test_sign_in(wrong_user)
      end
      
      it "should deny access" do
        delete :destroy, :id => @bike
        response.should redirect_to(root_path)
      end
    end
    
    describe "for an authorized user" do
      
      before(:each) do
        @user = test_sign_in(Factory(:user))
        @bike = Factory(:bike, :user => @user)
      end
      
      it "should destroy the micropost" do
        lambda do
          delete :destroy, :id => @bike
          flash[:success].should =~ /deleted/i
          response.should redirect_to(mybikes_path)
        end.should change(Bike, :count).by(-1)
      end
    end
  end
  
  
  
  # describe "PUT 'update'" do
  #     
  #     before(:each) do
  #       @bike = Factory(:bike)
  #       test_sign_in(@user)
  #     end
  #     
  #     describe "failure" do
  #       before(:each) do
  #         @attr = { :name => "", :description => "", :size => "",
  #                   :biketype => "", :price => "" }
  #       end
  #       
  #       it "should render the 'edit' page" do
  #         put :update, :id => @bike, :bike => @attr
  #         response.should render_template('edit')
  #       end
  #       
  #       it "should render the right title" do
  #         put :update, :id => @bike, :bike => @attr
  #         response.should have_selector('title', :content => "Edit Bike")
  #       end
  #     end
  #     
  #     describe "success" do
  #       
  #       before(:each) do
  #         @attr = { :name => "My Bike", :description => "The Best Bike", :size => "6 feet",
  #                   :biketype => "Road", :price => "19" }
  #       end
  #       
  #       it "should change the bike's attributes" do
  #         put :update, :id => @bike, :bike => @attr
  #         bike = assigns(:bike)
  #         @bike.reload
  #         @bike.name.should == bike.name
  #         @bike.description.should == bike.description
  #         @bike.size.should == bike.size
  #         @bike.price.should == bike.price
  #       end
  #       
  #       it "should have a flash message" do
  #         put :update, :id => @user, :bike => @attr
  #         flash[:success].should =~ /Bike Updated/
  #       end
  #     end
  #   end
  
end
