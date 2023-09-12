class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @cart_items = current_customer.cart_items
  end
  
  def index
    @orders = current_customer.orders
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def confirm
    
  end
  
  def complete
  end
  
  def create
  end
end
