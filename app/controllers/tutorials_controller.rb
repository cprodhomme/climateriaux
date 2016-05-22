class TutorialsController < ApplicationController

  def index
    @tutorials = Tutorial.all
  end

  def show

  end
end
