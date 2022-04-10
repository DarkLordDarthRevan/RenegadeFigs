class CartController < ApplicationController
  def create
    logger.debug("Adding #{params[:id]} to cart ")
    id = params[:id].to_i
    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id
      renegadefig = Renegadefig.find(id)
      flash[:notice] = "🛒 #{renegadefig.productName} added to cart."
      redirect_to root_path
    end
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    renegadefig = Renegadefig.find(id)
    flash[:notice] = "- #{renegadefig.productName} remove from cart"
    redirect_to root_path
  end
end
