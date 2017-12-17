class ItemsController < ApplicationController
	before_action :authenticate_user!, only:[]

	def show
		@item=Item.find(params[:id])
	end

end
