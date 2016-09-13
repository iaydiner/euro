class GemstonesController < ApplicationController
	def index
	@gemstonesall=Gemstone.all
	end
end