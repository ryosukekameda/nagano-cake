class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
   if @item.save
      redirect_to admin_item_path(@item.id)
   else
     render :new
   end
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price_without_tax, :image, :sales_status, :price)
  end
end
