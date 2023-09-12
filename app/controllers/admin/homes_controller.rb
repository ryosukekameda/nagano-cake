class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def admin
    @order = Order.where("created_at" === Date.today)
  end
end
