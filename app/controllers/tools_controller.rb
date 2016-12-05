class ToolsController < ApplicationController
	before_action :find_tool, only: [:edit, :update, :show, :destroy]
	def toolshome
		render :layout => "applicationtool"
	end

	def index
		@tools=Tool.all.order("created_at DESC")
	end

	def show
		
	end

	def new
		@tool=Tool.new
	end

	def create
		@tool=Tool.new(tool_params)
		if @tool.save
			redirect_to tools_path
		else
			render "new"
		end
	end

	def edit
	end

	def update
		
		if @tool.update(tool_params)
			redirect_to tools_path
		else
			render "edit"
		end
	end

	def destroy
		@tool.destroy
		redirect_to tools_path
	end

	private
	def tool_params
		params.require(:tool).permit(:title, :short_desc, :long_desc)
	end

	def find_tool
		@tool=Tool.find(params[:id])
	end

end