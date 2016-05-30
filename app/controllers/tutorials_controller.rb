class TutorialsController < ApplicationController

  def index
    @tutorials = Tutorial.all
  end

  def show
  	@tutorial = Tutorial.where(slug: params[:slug]).first
  end
end
