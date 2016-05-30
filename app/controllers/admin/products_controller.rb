class Admin::ProductsController < Admin::DashboardController

	def index
		@products = Product.all
	end

	def create
	end

	def edit
		@product = Product.where(slug: params[:slug], user: current_user).first
	end

	def update
	end

	def destroy
		@product = Product.where(slug: params[:slug], user: current_user).first
		authorize! :destroy, @product
	end

	private

  def tutorial_params
  	params.require(:product).permit(:name, :description)
  end

end
