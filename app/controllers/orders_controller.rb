class OrdersController < ApplicationController
	before_action :authenticate_user!

	def index
		@orders=Order.where(user_id: current_user.id)
	end

	def create
		params[:order][:user_id]=current_user.id
		params[:order][:item_id]=params[:id]
		params[:order][:counts]=1
		@order=Order.create(order_params)
	end

	def update
		@order.update
	    redirect_to orders_path
	end

	def destroy
		@order.destroy
		redirect_to orders_path
	end

	private

	def order_params
		params.require(:order).permit(:user_id,:item_id,:counts)
	end

	def set_order
		@order=Order.find(params[:id])
	end
end
