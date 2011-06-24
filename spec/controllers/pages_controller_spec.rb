require 'spec_helper'

describe PagesController do
  render_views
  
  before(:each) do
    @base_title = "Spinlister"
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
     it "should have the right title" do
        get 'home'
        response.should have_selector("title",
                                      :content => "#{@base_title} | Home")
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
                                      :content => "#{@base_title} | Contact")
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
                                       :content => "#{@base_title} | About")
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
                                        :content => "#{@base_title} | FAQ")
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
                                          :content => "#{@base_title} | Sign In")
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
                                            :content => "#{@base_title} | How it Works")
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
                                              :content => "#{@base_title} | List Your Bike")
            end
          end
end
