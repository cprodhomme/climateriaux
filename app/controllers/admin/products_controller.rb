class Admin::ProductsController < Admin::DashboardController
  load_and_authorize_resource

	def index
    if current_user.role == 'Admin'
		  @products = Product.all
    else
      @products = Product.where(user_id: current_user)
    end
	end

	def create
	end

	def edit
    if current_user.role == 'Admin'
		  @product = Product.where(slug: params[:slug]).first
      puts @product
    else
      @product = Product.where(slug: params[:slug], user_id: current_user).first
    end
	end

	def update
    
	end

	def destroy
    if current_user.role == 'Admin'
      Product.where(slug: params[:slug]).first.destroy
    else 
		  Product.where(slug: params[:slug], user_id: current_user).first.destroy
    end
    redirect_to admin_products_path, notice: "Le produit a bien été supprimé"
	end

	private

  def product_params
  	params.require(:product).permit(:name, :description, :marque, :category, :active)
  end

end
