class ApplicationController < ActionController::Base

  before_action :initialize_session
  helper_method :cart
  protect_from_forgery with: :null_session

  private
    def initialize_session
      session[:shopping_cart] ||= []
    end

    def cart
      Renegadefig.find(session[:shopping_cart])

    end

end
