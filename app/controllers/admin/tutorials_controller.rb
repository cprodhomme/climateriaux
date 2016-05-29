class Admin::TutorialsController < Admin::DashboardController

	def index
		if current_user.role == 'admin'
			@tutorials = Tutorial.all
		elsif current_user.role == 'merchant'
			@tutorials = Tutorial.where(user: current_user)
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
