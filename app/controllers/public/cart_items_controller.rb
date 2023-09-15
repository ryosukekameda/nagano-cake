class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  
  def index
    @cart_items = current_customer.cart_items
    @billing_amount = @cart_items.sum{|cart_item|cart_item.item.price_without_tax * cart_item.amount * 1.1}
  end
  
  def update
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer_id
    @cart_item.item_id = params[:item_id]
    if @cart_item.save
       redirect_to cart_items_path
    else
      flash[:alert] = "個数を選択してください"
       render item_path(@item.id)
    end
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash.now[:alert] = "#{@cart_item.item.name}を削除しました"
    redirect_to cart_items_path
  end
  
  def destroy_all
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    flash[:alert] = "カート内の商品を全て削除しました"
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end
end
