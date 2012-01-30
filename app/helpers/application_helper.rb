module ApplicationHelper

# Return a title on a per-page basis

def title
	base_title = "Ruby on Rails Tutorial Sample App"
	if @title.nil?
	base_title
	else
	"#{base_title} | #{@title}"
	end
	end
	
def logo
	image_tag("tuneboatlogo.png", :alt => "Tuneboat", :class => "round", :width=>50, :height=>50)
end
	
end
