class Admin::MerchantsController < Admin::DashboardController
  load_and_authorize_resource

  def index
    @merchants = Merchant.all
  end

  def new
    @merchant = Merchant.new
  end

  def create
    @merchant = Merchant.new(merchant_params)
    if @merchant.save
      flash[:success] = "Utilisateur ajouté avec succès !"
      redirect_to admin_merchants_path
    else
      render 'new'
    end
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])

    if @merchant.update_attributes(merchant_params)
      redirect_to edit_admin_merchant_path(@merchant.id), notice: 'Utilisateur a bien été modifié'
    else
      render 'edit'
    end
  end

  def destroy
    Merchant.destroy(params[:id])
    redirect_to admin_merchants_path, notice: "L'utisateur a bien été supprimé"
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name, :description, :logo)
  end
end
