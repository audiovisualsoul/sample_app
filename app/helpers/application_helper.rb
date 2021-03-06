module ApplicationHelper

# Return a title on a per-page basis

def title
	base_title = "Tuneboat"
	if @title.nil?
	base_title
	else
	"#{base_title} | #{@title}"
	end
	end
	
def logo
	image_tag("tuneboatlogo.png", :alt => "Tuneboat", :class => "round", :width=>80, :height=>80)
end

def lander
	image_tag("lander.png", :alt => "Sign up now!", :width => "650", :height => "600")
end
	
end
