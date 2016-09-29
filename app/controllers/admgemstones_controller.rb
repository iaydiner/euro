class AdmgemstonesController < ApplicationController

	layout "applicationadmin"
	has_scope :shape, type: :array
	has_scope :gemtype, type: :array
	has_scope :stone, type: :array
	def index
		@admgemstonesall = apply_scopes(Admgemstone).paginate(:page => params[:page], :per_page => 10)
		if params.inspect =='{"controller"=>"admgemstones", "action"=>"index"}'
			render "admgemstones/indexnodata"
		else
			render "admgemstones/index"
		end
	end

	def new
		@admgemstone = Admgemstone.new
	end

	def create
		@admgemstone = Admgemstone.new(admgemstone_params)
		if @admgemstone.save
			## if we sucseed we need to inform user and then redirect
			flash[:notice]="Gemstone was successfully created!"
			redirect_to admgemstone_path(@admgemstone)
		else
			##if we didnt save it due to form validation failed we show new template again
			flash.now[:error] = "Could not save Sorry"
			render 'new'
		end
	end

	def edit
		@admgemstone = Admgemstone.find(params[:id])
	end

	def update
		@admgemstone = Admgemstone.find(params[:id])
		if @admgemstone.update(admgemstone_params)
			flash[:notice] = "Gemstone record was successfully updated!"
			redirect_to admgemstone_path(@admgemstone)
		else
			render 'edit'
		end
	end

	def show
		##It should show specific gemstone for that reason using ID
		@admgemstone = Admgemstone.find(params[:id])
	end

	def destroy
		@admgemstone = Admgemstone.find(params[:id])
		@admgemstone.destroy
		flash[:notice]="Gemstone was successfully deleted"
		redirect_to admgemstones_path
	end

	private
	 def admgemstone_params
			params.require(:admgemstone).permit(:shape, :size, :stone, :colortone, :gemtype, :brand, :price)
	 end
end
