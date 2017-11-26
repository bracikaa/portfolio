module ApplicationHelper

	def login_helper style=''
		if current_user.is_a?(GuestUser)
			(link_to "Login", new_user_session_path, class: style) + " ".html_safe + 
	    	(link_to "Register", new_user_registration_path, class: style)	
	    else
	    	link_to "Logout", destroy_user_session_path, method: :delete, class: style 	
	    end
	end

    def source_helper
    	if session[:source]
    		content_tag(:p, "Thanks for visiting me from the #{session[:source]}", class: "source-greeting")
    	end
    end

    def show_to_admin?
		 logged_in?(:site_admin)
	end

	def capitalize_name(name)
		name[0].capitalize + name.slice(1..-1)
	end

	def nav_items
		[
			{
				url: root_path,
				name: "Home"
			},
			{
				url: about_path,
				name: "About"
			},
			{
				url: contact_path,
				name: "Contact"
			},
			{
				url: blogs_path,
				name: "Blogs"
			},
			{
				url: portfolio_posts_path,
				name: "Portfolio Posts"
			},
			{
				url: rails_news_path,
				name: "Rails News"
			}
		]
	end

	def nav_helper style, tag_type
		nav_links= ''
		nav_items.each do |nav_item|
			nav_links << "<#{tag_type}><a href='#{nav_item[:url]}' class='#{style} #{active? nav_item[:url]}''>#{nav_item[:name]}</a></#{tag_type}>"
		end

		#nav_links = <<NAV
		#<#{tag_type}><a href="#{root_path}" class="#{style} #{active? root_path}">Home</a></#{tag_type}>
		#<#{tag_type}><a href="#{}" class="#{style} #{active? about_path}">About</a></#{tag_type}>
		#<#{tag_type}><a href="#{}" class="#{style} #{active? contact_path}">Contact</a></#{tag_type}>
		#<#{tag_type}><a href="#{blogs_path}" class="#{style} #{active? blogs_path}">Blogs</a></#{tag_type}>
		#<#{tag_type}><a href="#{portfolio_posts_path}" class="#{style} #{active? portfolio_posts_path}">Portfolio Posts</a></#{tag_type}>
		#NAV

	nav_links.html_safe
	end

	def active? path
		"active" if current_page? path
	end
end
