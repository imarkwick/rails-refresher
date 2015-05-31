class RoastsController < ApplicationController

	def index
		@roasts = Roast.all
	end

	def new
		@roast = Roast.new
	end

	def create
		@roast = Roast.create(roast_params)
		redirect_to '/roasts'
	end

	def roast_params
		params.require(:roast).permit(:name)
	end

	def show
		@roast = Roast.find(params[:id])
	end

end
