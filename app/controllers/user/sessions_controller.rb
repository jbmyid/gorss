class User::SessionsController < Devise::SessionsController
	private

	def after_sign_in_path_for(resource)
		user_dashboard_index_path(resource)
	end
end