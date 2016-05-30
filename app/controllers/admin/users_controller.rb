class Admin::UsersController < Admin::DashboardController

  def index
    if current_user.role == 'admin'
      @users = User.all
    end
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
