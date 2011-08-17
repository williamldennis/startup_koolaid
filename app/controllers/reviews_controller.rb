class ReviewsController < ApplicationController
  


    def new
       @review = Review.new 
       @title = "List Your review"
     end

     def reviewshow
       @reviews = current_user.reviews
     end

     def index 

       #@reviews = review.near(location, 50, :order => :distance).paginate(:page => params[:page], :per_page => 9)
       scope = Review.near(location, 50, :order => :distance)
       if (reviewtype.present?)
         scope = scope.where(:reviewtype => reviewtype)
       end
       @reviews = scope.paginate(:page => params[:page], :per_page => 9)


     end

     def create
       if signed_in?
         @review = current_user.reviews.build(params[:review])
          if @review.save
            redirect_to myreviews_path, :flash => { :success => "Your review is Listed!" }
          else
            render 'reviews/listyourreview'
          end
        else
          render 'sessions/new'
        end
     end 

     def destroy
       @review.destroy
       redirect_to reviews_path, :flash => { :success => "review Deleted" }
     end

     def show
       @review = Review.find(params[:id])
       @title = @review.name
       # @feed_items = current_user.feed
     end

     def edit
       @review = Review.find(params[:id])
       @title = "Edit review"
     end

     def update
       @review = Review.find(params[:id])
       if @review.update_attributes(params[:review])
         redirect_to @review, :flash => { :success => "Profile Updated" }
       else
        @title = "Edit review"
        render 'edit'
       end
     end

     def location
       session[:location] = params[:search] || session[:location]
     end

     private

        def authorized_user
          @review = Review.find(params[:id])
          redirect_to root_path unless current_user?(@review.user)
        end

        def reviewtype
          params[:sort]
        end

  end
  
end

