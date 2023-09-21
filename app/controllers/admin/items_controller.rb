class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]

  def index
    @items = Item.page(params[:page])
  end
  
  def new
    @item = Item.new
  end
  
  def create
     @item = Item.new(item_params)
    if @item.save
       redirect_to admin_item_path(@item)
    else
       redirect_to new_admin_item_path
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
    if @item.update(item_params)
       redirect_to admin_items_path(@item)
    else
       redirect_to edit_admin_item_path(@item)
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price_without_tax, :image, :is_sales_status)
  end
end
