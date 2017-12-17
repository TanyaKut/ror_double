class OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_order, only:[:update]

	def index
		@orders=Order.where(user_id: current_user.id)
	end

	def create
		@order=Order.create(user_id: current_user.id,item_id: params[:format], counts: 1)
		redirect_to order_path
	end

	def update
		@order.update(order_paramse)
	    redirect_to orders_path
	end

	def destroy
		@order=Order.find(params[:id])
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
	