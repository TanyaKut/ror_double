class CategoriesController < ApplicationController

def show
	@categorie=Categorie.find(params[:id])
	@items=Item.where(categorie_id: @categorie.id)
end

def index
	@categories=Categorie.all
end

end
