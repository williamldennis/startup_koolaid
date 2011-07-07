require 'spec_helper'

describe Bike do

  before(:each) do
    @user = Factory(:user)
    @attr = { :name => "lorem ipsum", 
              :description => "lorem ipsum", 
              :size => "size",
              :type => "lorem ipsum", 
              :price => "6.00" }
  end
  
  it "should create a new instance with valid attributes" do
    @user.bikes.create!(@attr)
  end
  
  describe "user associations" do
    
    before(:each) do
      @bike = @user.bikes.create(@attr)
    end 
    
    it "should have a user attribute" do
      @bike.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @bike.user_id.should == @user.id
      @bike.user.should == @user
    end
  end
end
