class ItemsController < ApplicationController

	def show
		@item=Item.find(params[:id])
		@order=Order.where(item_id: item).first
	end

end
