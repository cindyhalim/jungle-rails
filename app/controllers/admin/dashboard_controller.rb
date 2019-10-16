class Admin::DashboardController < ApplicationController
  before_filter :authenticate
  def show
    @total_product = Product.all.count
    @total_category = Category.all.count
  end
end
