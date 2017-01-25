class FjewelriesController < ApplicationController
	
	before_action :just_admin, only: [:admin]
	has_scope :jewelry_type, type: :array
	has_scope :metal, type: :array
	has_scope :color, type: :array
	has_scope :stone, type: :array

	def index
		@fjewelries = apply_scopes(Fjewelry).all
		render :layout => "applicationfjewelry"
	end
	private
	def fjewelry_params
		params.require(:fjewelry).permit(:title, :short_desc, :long_desc, :toolcategory_id, :tool_img, :tool_img2, :sku, :price, :brand, :weight, :height, :width, :color, :metal, :whatt, :measuringrange, :battery, :usedwith,:depth)
	end

	def find_fjewelry
		@tool=Tool.find(params[:id])
	end

	def just_admin
  		authenticate_user!

	  if current_user.email=="info@europeandesign.ca"
	     return
	  else
	     redirect_to root_path # or whatever
	  end
	end
end
