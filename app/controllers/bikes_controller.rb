class BikesController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]
  before_filter :authorized_user, :only => [:destroy]
  

  
  def listyourbike 
     @bike = Bike.new 
     @title = "List Your Bike"
   end
   
   def bikeshow
     @bikes = current_user.bikes
   end
   
   def index 
     
     #@bikes = Bike.near(location, 50, :order => :distance).paginate(:page => params[:page], :per_page => 9)
     scope = Bike.near(location, 100, :order => :distance)
     if (biketype.present?)
       scope = scope.where(:biketype => biketype)
     end
     @bikes = scope.paginate(:page => params[:page], :per_page => 9)
     
     
   end
   
   def create
     if signed_in?
       @bike = current_user.bikes.build(params[:bike])
        if @bike.save
          redirect_to mybikes_path, :flash => { :success => "Your Bike is Listed!" }
        else
          render 'bikes/listyourbike'
        end
      else
        render 'sessions/new'
      end
   end 
   
   def destroy
     @bike.destroy
     redirect_to mybikes_path, :flash => { :success => "Bike Deleted" }
   end
   
   def show
     @bike = Bike.find(params[:id])
     @title = @bike.name
     # @feed_items = current_user.feed
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
   
   def location
     session[:location] = params[:search] || session[:location]
   end
   
   private
  
      def authorized_user
        @bike = Bike.find(params[:id])
        redirect_to root_path unless current_user?(@bike.user)
      end
      
      def biketype
        params[:sort]
      end

end
