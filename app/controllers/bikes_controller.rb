class BikesController < ApplicationController
  def listyourbike 
     @bike = bike.user
     @title = "List Your Bike"
   end
   
   def create
     @bike = Bike.new
     redirect_to mybikes_path, :flash => { :success => "Your Bike is Listed!" }
   end
   
   def show
     @bike = Bike.find(params[:id])
     @title = @bike.name
   end
   
end
