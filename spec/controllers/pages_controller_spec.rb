require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
     it "should have the right title" do
        get 'home'
        response.should have_selector("title",
                                      :content => "Spinlister | Home")
     end
    
    it "should have a non-blank body" do
      get 'home'
      response.body.should_not =~ /<body>\s*<\/body>/ 
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    
    it "should have the right title" do
        get 'contact'
        response.should have_selector("title",
                                      :content => "Spinlister | Contact")
    end
  end
  
  describe "GET 'about'" do
     it "should be successful" do
       get 'about'
       response.should be_success
     end
     
     it "should have the right title" do
         get 'about'
         response.should have_selector("title",
                                       :content => "Spinlister | About")
     end
   end
   
   describe "GET 'faq'" do
      it "should be successful" do
        get 'faq'
        response.should be_success
      end

      it "should have the right title" do
          get 'faq'
          response.should have_selector("title",
                                        :content => "Spinlister | FAQ")
      end
    end
    
    describe "GET 'signup'" do
       it "should be successful" do
         get 'signup'
         response.should be_success
       end

       it "should have the right title" do
           get 'signup'
           response.should have_selector("title",
                                         :content => "Spinlister | Sign Up")
       end
     end
     
     describe "GET 'signin'" do
        it "should be successful" do
          get 'signin'
          response.should be_success
        end

        it "should have the right title" do
            get 'signin'
            response.should have_selector("title",
                                          :content => "Spinlister | Sign In")
        end
      end
      
      describe "GET 'howitworks'" do
          it "should be successful" do
            get 'howitworks'
            response.should be_success
          end

          it "should have the right title" do
              get 'howitworks'
              response.should have_selector("title",
                                            :content => "Spinlister | How it Works")
          end
        end
        
        describe "GET 'listyourbike'" do
            it "should be successful" do
              get 'listyourbike'
              response.should be_success
            end

            it "should have the right title" do
                get 'listyourbike'
                response.should have_selector("title",
                                              :content => "Spinlister | List Your Bike")
            end
          end
end
