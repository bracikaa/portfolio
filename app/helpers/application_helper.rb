module ApplicationHelper

	def login_helper
		if current_user.is_a?(GuestUser)
			(link_to "Login", new_user_session_path) + "<br>".html_safe + 
	    	(link_to "Register", new_user_registration_path)	
	    else
	    	link_to "Logout", destroy_user_session_path, method: :delete	
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
end
