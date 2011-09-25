module ApplicationHelper
  
  include TweetButton
  
  # Return a title on a per-page basis.
  def title
    base_title = "Startup Koolaid"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "Start Up Koolaid", :class => "round", :id => "suklogo")
  end
  
  def bike
    image_tag("bike-jpeg-blog.gif", :alt => "Great looking bike", :class => "round")
  end
  
end
