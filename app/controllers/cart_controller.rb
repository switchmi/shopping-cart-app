class CartController < ApplicationController
  before_action :authenticate_user!
  def show
    cart_ids = $redis.hkeys current_user_cart
    @products = Product.find(cart_ids)
  end

  def add
    cart_ids = $redis.hkeys current_user_cart
    @products = Product.find(cart_ids)
    if $redis.hexists current_user_cart, params[:product_id]
      $redis.hincrby current_user_cart, params[:product_id], 1
    else
      $redis.hset current_user_cart, params[:product_id], 1
    end
    # render json: current_user.cart_count, status: 200
    respond_to do |format|
      format.html {redirect_to product_path(params[:product_id])}
      format.js
    end
  end

  def remove
    cart_ids = $redis.hkeys current_user_cart
    @products = Product.find(cart_ids)
    quantity = $redis.hget current_user_cart, params[:product_id]
    if quantity.to_i == 1
      $redis.hdel current_user_cart, params[:product_id]
    else
      $redis.hincrby current_user_cart, params[:product_id], -1
    end
    respond_to do |format|
      format.html {redirect_to product_path(params[:product_id])}
      format.js
    end
  end

  private
  def current_user_cart
    "cart#{current_user.id}"
  end
end
