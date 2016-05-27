class Admin::DashboardController < ApplicationController
  before_filter :verify_admin

  layout 'admin'

  def index
    
  end

  private
  def verify_admin
    #redirect_to root_url unless current_user.try(:admin?)
  end
end
