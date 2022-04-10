class CheckoutController < ApplicationController

  def create
    renegadefigs = Renegadefig.find(params[:id])

    if renegadefigs.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create.(
      payment_method_types: ["card"],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
      line_items: [
        {
          name:renegadefigs.productName,
          description:renegadefigs.description,
          price: renegadefigs.price_cents,
          currency: "cad",
          quantity: 1
        }
      ]
    )

    respond_to do |format|
      format.js
    end
  end

  def success

  end

  def cancel

  end
end
