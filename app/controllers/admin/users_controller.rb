class Admin::UsersController < Admin::DashboardController

  def index
    if current_user.role == 'admin'
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Utilisateur ajouté avec succès !"
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:email, :password,
                                 :password_confirmation, :role)
  end
end
