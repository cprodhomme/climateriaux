class Admin::TutorialsController < ApplicationController

	def index
		@tutorials = Tutorial.where(user_id: current_user)
	end

	def show
		@tutorial = Tutorial.where(slug: params[:slug], user_id: current_user).first
	end

	def create
	end

	def update
	end

	def delete
	end

end
