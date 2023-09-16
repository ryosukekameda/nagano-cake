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
  　order = Order.new(session[:order])
  　order.save
  　cart_items = current_customer.cart_items
  　cart_items.each do |cart_item|
  　   order_detail = OrderDetail.new
  　   order_detail.order_id = order.id
  　   order_detai.amount = cart_item.amount
  　   order_detail.making_status = 0
  　   order_detail.save
  end
  
  def create
    customer = current_customer
    session[:order] = Order.new
    cart_items = current_customer.cart_items
    sum = 0
    cart_items.each do |cart_item|
      sum += (cart_item.item.price_without_tax * 1.1).floor * cart_item.amount
    end
    session[:order][:postage] = 800
    session[:order][:billing_amount] = sum + session[:order][:postage]
    session[:order][:order_status] = 0
    session[:order][:customer_id] = current_customer.id
    session[:order][:billing_amount] = params[:method].to_i
    session[:order][:post_cade] = params[:post_code]
    session[:order][:address] = params[:address]
    session[:order][:name] = params[:name]
    if session[:order][:post_code].presence && session[:order][:address].presence && session[:order][:name].presence
       redirect_to confirm_path
    else
       redirect_to new_order_path
    end
  end
  
  end
end
