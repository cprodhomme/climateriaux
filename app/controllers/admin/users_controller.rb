class Admin::UsersController < Admin::DashboardController
  load_and_authorize_resource
  before_filter :skip_password_attribute, only: :update

  def index
    if current_user.role == 'Admin'
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
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to edit_admin_user_path(@user.id), notice: 'Utilisateur a bien été modifié'
    else
      render 'edit'
    end
  end

  def destroy
    User.destroy(params[:id])
    redirect_to admin_users_path, notice: "L'utisateur a bien été supprimé"
  end

  private

  def skip_password_attribute
    if params[:user][:password].blank?
      params[:user].delete :password
      params[:user].delete :password_confirmation
    end
  end

  def user_params
    params.require(:user).permit(:email, :password,
                                 :password_confirmation, :role)
  end
end
