class Admin::ProductsController < Admin::DashboardController
  load_and_authorize_resource

	def index
    if current_user.role == 'Admin'
		  @products = Product.all
    else
      @products = Product.where(user_id: current_user)
    end
	end

  def new
    @product = Product.new
    @product.product_images.build
    @categories = Category.all
  end

	def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "produit ajouté avec succès !"
      redirect_to admin_products_path
    else
      render 'new'
    end
	end

	def edit
    if current_user.role == 'Admin'
		  @product = Product.where(slug: params[:slug]).first
    else
      @product = Product.where(slug: params[:slug], user_id: current_user).first
    end
  end

	def update
    if current_user.role == 'Admin'
      @product = Product.where(slug: params[:slug]).first
    else
      @product = Product.where(slug: params[:slug], user: current_user).first
    end

    if @product.update_attributes(product_params)
      redirect_to edit_admin_product_path(slug: @product.slug), notice: 'Votre produit a bien été modifié'
    else
      render 'edit'
    end
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
  	params.require(:product).permit(:name, :description, :slug, :price, :marque,
                                    :quantity, :category_id, :active, :merchant_id,
                                    :product_images_attributes => [:id, :image, :_destroy]).merge(user_id: current_user)
  end

end
