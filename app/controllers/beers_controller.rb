class BeersController < ApplicationController
  def index
    @beers =  Shoppe::ProductCategory.find(4).products
    @badges= Hash.new
    current_order.order_items.collect { |x|  @badges[x.ordered_item.permalink.to_sym] = x.quantity}  
    

    #    @beers = Shoppe::Product.root.ordered.includes(:product_categories, :variants)
    #@beers = @beers.group_by(&:product_category)
  end

  def show
    @beers = Shoppe::Product.root.find_by_permalink(params[:permalink])
  end

  def buy
    begin  
      @beer = Shoppe::Product.root.find_by_permalink!(params[:permalink])
      current_order.order_items.add_item(@beer, 1)
    rescue Shoppe::Errors::NotEnoughStock  
        respond_to do |format|
        format.html { 
          redirect_to beers_index_path, :notice => "Lo sentimos pero no tenemos más existencias del producto seleccionado"
        }
        format.json { 
            render json: {error: "Lo sentimos pero no tenemos más existencias del producto seleccionado"} , status: :not_acceptable
          }
      end
    else  
      respond_to do |format|
        format.html { 
          redirect_to beers_index_path, :notice => "Product has been added successfuly!"
        }
        format.json { 
            render json: {total_items: current_order.total_items+1, total_before_tax: current_order.total_before_tax + @beer.price } 
          }
      end 
    end  
  end

  def remove
    begin  
      @beer = Shoppe::Product.root.find_by_permalink!(params[:permalink])
      
      current_order.order_items.each do |item|
        if item.ordered_item.permalink == params[:permalink]
          item.decrease!
        end
      end
    rescue  Exception => e 
        
    else  
      respond_to do |format|
        format.html { 
          redirect_to beers_index_path, :notice => "Product has been added successfuly!"
        }
        format.json { 
            render json: {total_items: current_order.total_items, total_before_tax: current_order.total_before_tax  } 
          }
      end 
    end  
  end


end
