class FjewelriesController < ApplicationController
	before_action :find_fjewelry, only: [:edit, :update, :show, :destroy]
	before_action :just_admin, only: [:admin]
	has_scope :jewelry_type, type: :array
	has_scope :metal, type: :array
	has_scope :color, type: :array
	has_scope :stone, type: :array
layout "applicationfjewelry"
	def index
	
		@fjewelries = apply_scopes(Fjewelry).all
		render :layout => "applicationfjewelry"
	end

	def new
		@fjewelry=Fjewelry.new
		render layout: "applicationfjewelry"
	end

	def create
		@fjewelry=Fjewelry.new(fjewelry_params)
		if @fjewelry.save
			redirect_to fjewelries_path
		else
			render "new"
		end
	end

	def show
		#raise @fjewelries.inspect
		#Rails.logger.debug params.inspect
		#urun detay sayfasindayken sidebar da ki filtreleme calissin diye duzenleme yapildi
	
		#if params[:jewelry_type] || params[:metal] || params[:color] || params[:stone]
			#@fjewelries = apply_scopes(Fjewelry).all
			#redirect_to fjewelries_path(@fjewelries)
		#	render "index"
		#else
		#	@fjewelry=Fjewelry.find(params[:id])
		#end
	
		#if @fjewelries.nil? 
	    #	@fjewelries = apply_scopes(Fjewelry).all
	    #	flash.now[:alert] = "search again"
	    #	render "index"
  		#end
	end

	def edit
		#@fjewelry = Fjewelry.find(params[:id])
		#render layout: "applicationfjewelry"
	end

	def update
		#@fjewelry = Fjewelry.find(params[:id])
		if @fjewelry.update(fjewelry_params)
			flash[:notice] = "Finished Jewelry record was successfully updated!"
			redirect_to fjewelry_path(@fjewelry)
		else
			render 'edit'
		end
	end

	def destroy
		@fjewelry.destroy
		redirect_to fjewelries_path
	end
	
	private
	def fjewelry_params
		params.require(:fjewelry).permit(:title, :short_desc, :long_desc, :sku, :price, :jewelry_type, :metal, :color, :stone, :fjewelry_img)
	end

	def find_fjewelry
		@fjewelry=Fjewelry.find(params[:id])
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
