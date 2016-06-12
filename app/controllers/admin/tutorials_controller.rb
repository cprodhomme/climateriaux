class Admin::TutorialsController < Admin::DashboardController
	load_and_authorize_resource

	def index
		if current_user.role == 'Admin'
			@tutorials = Tutorial.all.includes(:user)
		elsif current_user.role == 'Merchant'
			@tutorials = Tutorial.where(user: current_user).includes(:user)
    end
	end

	def new
		@tutorial = Tutorial.new
	end

	def create
		@tutorial = Tutorial.new(tutorial_params)
    if @tutorial.save
      flash[:success] = "Tutoriel ajouté avec succès !"
      redirect_to admin_tutorials_path
    else
      render 'new'
    end
	end

	def edit
		@tutorial = Tutorial.where(slug: params[:slug], user: current_user).first
	end

	def update
	end

	def destroy
		@tutorial = Tutorial.where(slug: params[:slug]).first.destroy
		redirect_to admin_tutorials_path, notice: "Le tutoriel a bien été supprimé"
	end

	private

  def tutorial_params
  	params.require(:tutorial).permit(:title, :slug, :resume, :content).merge(user_id: current_user)
  end

end
