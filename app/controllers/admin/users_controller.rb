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
    @user = User.find(params[:id])

    if needs_password?(@user, user_params)
      if @user.update_attributes(user_params)
        redirect_to edit_admin_user_path(@user.id), notice: 'Utilisateur a bien été modifié'
      else
        render 'edit'
      end
    else
      if @user.update_attributes(user_params_without_password)
        redirect_to edit_admin_user_path(@user.id), notice: 'Utilisateur a bien été modifié'
      else
        render 'edit'
      end
    end
  end

  def destroy
    User.destroy(params[:id])
    redirect_to admin_users_path, notice: "L'utisateur a bien été supprimé"
  end

  private

  def needs_password?(user, user_params)
    !user_params[:password].blank?
  end

  def user_params
    params.require(:user).permit(:email, :password,
                                 :password_confirmation, :role)
  end

  def user_params_without_password
    params.require(:user).permit(:email, :password,
                                 :password_confirmation, :role)
  end
end
