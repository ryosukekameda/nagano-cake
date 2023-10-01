class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @customer = current_customer
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
      session[:order][:payment_method] = params[:method].to_i
      destination = params[:a_method].to_i
      if destination == 0
         session[:order][:postal_code] = customer.postal_code
         session[:order][:address] = customer.address
         session[:order][:name] = customer.full_name
      elsif destination == 1
         session[:new_address] = 1
         session[:order][:postal_code] = params[:postal_code]
         session[:order][:address] = params[:address]
         session[:order][:name] = params[:name]
      end
    if session[:order][:postal_code].presence && session[:order][:address].presence && session[:order][:name].presence
       redirect_to confirm_path
    else
       redirect_to new_order_path
    end
  end
  
  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    # customer = current_customer
    # @order = Order.new(session[:order])
    # sum = 0
    # @cart_items.each do |cart_item|
      # sum += (cart_item.item.price_without_tax * 1.1).floor * cart_item.amount
    # end
    # session[:order] = Order.new()
    # session[:order][:postage] = 800
    # session[:order][:billing_amount] = sum + session[:order][:postage]
    # session[:order][:payment_method] = params[:method].to_i
    # session[:order][:postal_code] = customer.postal_code
    # session[:order][:address] = customer.address
    # session[:order][:name] = customer.full_name
  end
  
  def complete
    order = Order.new(session[:order])
    order.save
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = order.id
      order_detail.amount = cart_item.amount
      order_detail.making_status = 0
      order_detail.price = (cart_item.item.price_without_tax * 1.1).floor
      order_detail.save
    end
    cart_items.destroy_all
      # redirect_to complete_order_path(@order)
  end
  
  def index
    @orders = current_customer.orders
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    # @order.created_at = Time.now
  end
  
  private

  def order_params
    params.require(:order).permit(:customer_id, :postage, :billing_amount, :payment_method, :ordr_status, :postal_code, :address, :name)
  end
end

