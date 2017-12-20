class ItemsController < ApplicationController

	def show
		@item=Item.find(params[:id])
		@order=Order.where(item_id: item).first
	end

	def edit
		@item=Item.find(params[:id])
	end

	def update
		@item=Item.find(params[:id])
		@item.update(item_params)
	end

private
	def item_params
		params.require(:item).permit(:name,:description,:image)
	end

end
