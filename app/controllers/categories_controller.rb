class CategoriesController < ApplicationController

def show

	@categorie=Categorie.find(params[:id])
	@items=Item.where(categorie_id: @categorie.id)
	if current_user !=nil
	@orders=[]
	@items.each do |item|
		@orders[item.id]=Order.where(user_id: current_user.id ,item_id: item).first

	end

	else
	@orders=nil
	end
end

end
