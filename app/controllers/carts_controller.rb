class CartsController < ApplicationController
  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(params[:cart])
    if @cart.save
      redirect_to root_url, :notice => "Successfully created cart."
    else
      render :action => 'new'
    end
  end
  
  def show
   @cart = Cart.find(params[:id])
  end
  
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    session[:cart_id] = nil
  
    respond_to do |format|
      format.html { redirect_to(bikes_path,
      :flash => { :success => "Your cart has been cleared." }) }
      format.xml { head :ok }
    end
  end
  
  def update
    @cart = Cart.find(params[:id])
     respond_to do |format|
        if @cart.update_attributes(params[:cart])
          format.html { redirect_to(@cart, :notice => 'Dates Set.') }
          format.xml  { head :ok }
        end
      end
  end

end
