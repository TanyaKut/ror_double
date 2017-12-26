class OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_order, only:[:update]

	def index
		@orders=[];
    	@orders=Order.where(user_id: current_user.id)
   	 @order=nil
	end

	def create
		@order=Order.create(user_id: current_user.id,item_id: params[:id], counts: 1)
		redirect_to orders_path
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

	def plus
		@order=Order.where(user_id: current_user.id,item_id: params[:id]).first
		@order.update(counts: @order.counts+1)
		redirect_to orders_path	
	end

	def minus
		@order=Order.where(user_id: current_user.id,item_id: params[:id]).first
		if @order.counts>1
		@order.update(counts: @order.counts-1)
	    end
	    redirect_to orders_path
	end

	def confirm
		@orders=Order.where(user_id: current_user.id)
		@orders.each do |order|
			order.update(stats: true)
		end
		redirect_to root_path
	end

	private

	def order_params
		params.require(:order).permit(:user_id,:item_id,:counts)
	end

	def set_order
		@order=Order.find(params[:id])
	end


end
	