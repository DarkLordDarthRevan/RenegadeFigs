class AboutController < ApplicationController
  def about
    @about = About.all
  end
  def show
    @about = About.find(params[:id])
  end
end
