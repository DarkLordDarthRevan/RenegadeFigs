class RenegadefigsController < ApplicationController
  def index
    @renegadefigs = Renegadefig.all

    @renegadefigs = Kaminari.paginate_array(@renegadefigs).page(params[:page]).per(5)

  end

  def show
    @renegadefigs = Renegadefig.find(params[:id])

  end

  def new
    @renegadefigs = Renegadefig.new
  end

  def create
    @renegadefigs = Renegadefig.new(product_params)

    if @renegadefigs.save
      redirect_to @renegadefigs
    else
      render :new, status: :unprocessable_entity

    end
  end
  def edit
    @renegadefigs = Renegadefig.find(params[:id])
  end
  def update
    @renegadefigs = Renegadefig.find(params[:id])

    if @renegadefigs.update(product_params)
      redirect_to @renegadefigs
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @renegadefigs = Renegadefig.find(params[:id])
    @renegadefigs.destroy

    redirect_to root_path, status: :see_other
  end
  def category
    @category = Category.all
  end
  def incategory
    @category = Category.find(params[:id])
    @renegadefigs = Renegadefig.where("category = ?", @category.name)
  end
  def search
    wildcard_search = "%#{params[:keywords]}%"
    cat_search = "%#{params[:cat]}%"
    @renegadefigs = Renegadefig.where("productName LIKE ?", wildcard_search).where("category Like ?", cat_search)
  end
  private
    def product_params
      params.require(:renegadefig).permit(:productName, :description, :price, :stock)
    end
end
