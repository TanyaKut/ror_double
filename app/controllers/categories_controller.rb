class CategoriesController < ApplicationController

def show
	@orders=[]
	@categorie=Categorie.find(params[:id])
	@items=Item.where(categorie_id: @categorie.id)
	@items.each do |item|
		@orders[item.id]=Order.where(item_id: item).first
	end
end

end
