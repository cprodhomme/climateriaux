class HomeController < ApplicationController
	def index
    @tutorials = Tutorial.last(5)
	end
end
