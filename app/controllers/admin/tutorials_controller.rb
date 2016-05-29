class Admin::TutorialsController < Admin::DashboardController

	def index
		if current_user.role == 'admin'
			@tutorials = Tutorial.all
		elsif current_user.role == 'merchant'
			@tutorials = Tutorial.where(user: current_user)
		end
	end

	def show
		@tutorial = Tutorial.where(slug: params[:slug], user_id: current_user).first
	end

	def create
	end

	def update
	end

	def delete
	end

end
