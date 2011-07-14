class BikesController < ApplicationController

  before_filter :authenticate, :except => :index
  before_filter :authorized_user, :only => :destroy
  
  def listyourbike 
     @bike = Bike.new if signed_in?
     @title = "List Your Bike"
   end
   
   def bikeshow
     @bikes = current_user.bikes
   end
   
   def index 
     @title = "Bikes"
     if params[:search]
       @bikes = Bike.find(:all, :conditions => ['LOWER (city) LIKE ?', "%#{params[:search.downcase]}%"])
     else
       @bikes = Bike.all
     end
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
     @bike = Bike.find(params[:id])
     @title = @bike.name
     @feed_items = current_user.feed
   end
   
   def edit
     @bike = Bike.find(params[:id])
     @title = "Edit Bike"
   end
   
   def update
     @bike = Bike.find(params[:id])
     if @bike.update_attributes(params[:bike])
       redirect_to @bike, :flash => { :success => "Profile Updated" }
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
