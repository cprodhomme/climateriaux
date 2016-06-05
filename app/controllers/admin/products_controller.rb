class Admin::ProductsController < Admin::DashboardController
  load_and_authorize_resource

	def index
		@products = Product.all
	end

	def create
	end

	def edit
		@product = Product.where(slug: params[:slug]).first
	end

	def update
    
	end

	def destroy
		Product.where(slug: params[:slug]).first.destroy
    redirect_to admin_products_path, notice: "Le produit a bien été supprimé"
	end

	private

  def product_params
  	params.require(:product).permit(:name, :description, :marque, :category, :active)
  end

end
