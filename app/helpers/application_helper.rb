module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Campus Deliveries"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("campusdeliverieslogo.png", :alt => "Spinlister", :class => "round")
  end
  
  def bike
    image_tag("bike-jpeg-blog.gif", :alt => "Great looking bike", :class => "round")
  end
end
