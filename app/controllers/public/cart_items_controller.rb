class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  
  def index
    @cart_items = current_customer.cart_items
    @billing_amount = @cart_items.sum do |cart_item|
      item_price = cart_item.item.price_without_tax || 0
      item_amount = cart_item.amount || 0
      (item_price * item_amount * 1.1).floor
    end
  end

  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
    if @cart_item
      @cart_item.amount += params[:cart_item][:amount].to_i
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.item_id = params[:item_id]
    end
    if @cart_item.save
       redirect_to cart_items_path
    else
      flash[:alert] = "個数を選択してください"
       redirect_to items_path
    end
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash.now[:alert] = "#{@cart_item.item.name}を削除しました"
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice: 'カートを空にしました'
  end

  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end
end
