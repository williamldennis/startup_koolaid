module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Spinlister"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("SpinlisterLogo.png", :alt => "Spinlister", :class => "round")
  end
end
