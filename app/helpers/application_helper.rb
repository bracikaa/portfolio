module ApplicationHelper

	def login_helper
		if current_user.instance_of? User
	    	link_to "Logout", destroy_user_session_path, method: :delete
	    elsif current_user.instance_of? OpenStruct
	     	(link_to "Login", new_user_session_path) + "<br>".html_safe + 
	    	(link_to "Register", new_user_registration_path)	
	    end
	end

    def source_helper
    	if session[:source]
    		content_tag(:p, "Thanks for visiting me from the #{session[:source]}", class: "source-greeting")
    	end
    end
end
