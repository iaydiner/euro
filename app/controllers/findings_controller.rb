class FindingsController < ApplicationController

	before_action :find_finding, only: [:edit, :update, :show, :destroy]
	before_action :just_admin, only: [:admin]
	has_scope :finding_type, type: :array
	has_scope :metal, type: :array
	has_scope :color, type: :array

layout "applicationfinding"

	def index
		@findings = apply_scopes(Finding).all
		render :layout => "applicationfinding"
	end

	def new
		@finding=Finding.new
		render layout: "applicationfinding"
	end

	def create
		@finding=Finding.new(finding_params)
		if @finding.save
			redirect_to findings_path
		else
			render "new"
		end
	end

	def show

	end

	def edit
		#@finding = finding.find(params[:id])
		#render layout: "applicationfinding"
	end

	def update
		#@finding = finding.find(params[:id])
		if @finding.update(finding_params)
			flash[:notice] = "Finding record was successfully updated!"
			redirect_to finding_path(@finding)
		else
			render 'edit'
		end
	end

	def destroy
		@finding.destroy
		redirect_to findings_path
	end
	
	private
	def finding_params
		params.require(:finding).permit(:title, :short_desc, :long_desc, :sku, :price, :finding_type, :metal, :color, :stone, :finding_img)
	end

	def find_finding
		@finding=Finding.find(params[:id])
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