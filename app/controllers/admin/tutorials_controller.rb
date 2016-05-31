class Admin::TutorialsController < Admin::DashboardController

	def index
		if current_user.role == 'Admin'
			@tutorials = Tutorial.all.includes(:user)
		elsif current_user.role == 'Merchant'
			@tutorials = Tutorial.where(user: current_user).includes(:user)
		end
	end

	def create
	end

	def edit
		@tutorial = Tutorial.where(slug: params[:slug], user: current_user).first
	end

	def update
	end

	def destroy
		@tutorial = Tutorial.where(slug: params[:slug], user: current_user).first
		authorize! :destroy, @tutorial
	end

	private

  def tutorial_params
  	params.require(:tutorial).permit(:title, :resume, :content)
  end

end
