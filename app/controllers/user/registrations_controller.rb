class User::RegistrationsController < Devise::RegistrationsController
	
	private

	def after_sign_up_path_for(resource)
		user_dashboard_index_path
	end
end