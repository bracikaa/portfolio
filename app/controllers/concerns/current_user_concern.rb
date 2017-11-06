module CurrentUserConcern
	extend ActiveSupport::Concern
	
	def current_user
  	super || guest = OpenStruct.new(name: "Guest User", 
  									first_name: "Guest", 
  									last_name: "User", 
  									email: "guest@exmple.com"
  								   )
  end
end