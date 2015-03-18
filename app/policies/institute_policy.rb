class InstitutePolicy < AdminPolicy
	def add_user_to_institute?
		@current_user.admin?
	end
	def add_user_to_current_institute
		@current_user.iadmin?
	end
end