class BikesController < ApplicationController

  before_filter :authenticate
  
  def listyourbike 
     @bike = Bike.new if signed_in?
     @title = "List Your Bike"
   end
   
   def create
     @bike = current_user.bikes.build(params[:bike])
      if @bike.save
        redirect_to mybikes_path, :flash => { :success => "Your Bike is Listed!" }
      else
        render 'bikes/listyourbike'
      end
   end
   
   def destroy
   end
   
   def show
     @bike = Bike.new if signed_in?
     @title = @bike.name
   end
end
