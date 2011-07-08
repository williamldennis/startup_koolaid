class BikesController < ApplicationController

  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy
  
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
     @bike.destroy
     redirect_to mybikes_path, :flash => { :success => "Bike Deleted" }
   end
   
   def show
     @bike = Bike.new
     @title = @bike.name
     @feed_items = current_user.feed
   end
   
   def edit
     @bike = Bike.new
     @title = "Edit Bike"
     @feed_items = current_user.feed
   end
   
   def update
     @bike = Bike.new
     @feed_items = current_user.feed
     if @bike.update_attributes(params[:user])
       redirect_to @bike, :flash => { :success => "Bike Updated" }
     else
      @title = "Edit Bike"
      render 'edit'
     end
   end
   
   private
   
      def authorized_user
        @bike = Bike.find(params[:id])
        redirect_to root_path unless current_user?(@bike.user)
      end

end
