class BeersController < ApplicationController
def index
    @beers =  Shoppe::ProductCategory.find(4).products
    

    #    @beers = Shoppe::Product.root.ordered.includes(:product_categories, :variants)
    #@beers = @beers.group_by(&:product_category)
  end

  def show
    @beers = Shoppe::Product.root.find_by_permalink(params[:permalink])
  end
end
