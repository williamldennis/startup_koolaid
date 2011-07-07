require 'spec_helper'

describe Bike do

  before(:each) do
    @user = Factory(:user)
    @attr = { :name => "lorem ipsum", 
              :description => "lorem ipsum", 
              :size => "size",
              :biketype => "lorem ipsum", 
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
  
  describe "validations" do
    
    it "should have a user id" do
      Bike.new(@attr).should_not be_valid
    end
    
    it "should require nonblank name" do
      @user.bikes.build(:name => "  ").should_not be_valid
    end
    
    it "should require nonblank description" do
      @user.bikes.build(:description => "  ").should_not be_valid
    end
          
    it "should require nonblank size" do
      @user.bikes.build(:size => "  ").should_not be_valid  
    end
    
    it "should require nonblank type" do
      @user.bikes.build(:biketype => "  ").should_not be_valid
    end
          
    it "should require nonblank price" do
      @user.bikes.build(:price => "  ").should_not be_valid  
    end
    
    
  end
end
