class Admin::ProductsController < Admin::DashboardController

	def index
		@products = Product.all
	end

	def show
		@products = Product.where(slug: params[:slug]).first
	end

	def create
	end

	def update
	end

	def delete
	end
end
