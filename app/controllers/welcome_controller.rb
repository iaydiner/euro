class WelcomeController < ApplicationController
	before_action :just_admin, only: [:admin]
	has_scope :shape, type: :array
	has_scope :gemtype, type: :array
	has_scope :stone, type: :array
	def home
	end

	def about
	end

	def admin
		render :layout => "applicationadmin"
	end

	def gemstone
		@admgemstonesall = apply_scopes(Admgemstone).paginate(:page => params[:page], :per_page => 10)
		##@admgemstonesall = apply_scopes(Admgemstone).all
		##@admgemstonesall=Admgemstone.all
		##@admgemstonesall=Admgemstone.where(shape: 'Round').load
		##@admgemstonesall=Admgemstone.where(shape: ["Round","Square","Trillium","Marquis","Pear"]).load
		##Rails.logger.debug params.inspect
		if params.inspect =='{"controller"=>"welcome", "action"=>"gemstone"}'
			render "welcome/gemstonenodata"
			##render :js => "alert('gemstonenodata');"
		else
			render "welcome/gemstone"
			##render :js => "alert('gemstone');"
		end
	end
	private
	def just_admin
  		authenticate_user!

	  if current_user.email=="info@europeandesign.ca"
	     return
	  else
	     redirect_to root_path # or whatever
	  end
	end
end