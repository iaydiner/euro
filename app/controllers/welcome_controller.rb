class WelcomeController < ApplicationController

	def home
	end

	def about
	end

	def admin
		render :layout => "applicationadmin"
	end

	def gemstone
		@admgemstonesall=Admgemstone.all
		##@admgemstonesall=Admgemstone.where(shape: 'Round').load
		##@admgemstonesall=Admgemstone.where(shape: ["Round","Square","Trillium","Marquis","Pear"]).load
		render "welcome/gemstone"
	end
end