class CartController < ApplicationController
  before_action :authenticate_user!
  def show
    cart_ids = $redis.hkeys current_user_cart
    @products = Product.find(cart_ids)
  end

  def add
    if $redis.hexists current_user_cart, params[:product_id]
      $redis.hincrby current_user_cart, params[:product_id], 1
    else
      $redis.hset current_user_cart, params[:product_id], 1
    end
    # render json: current_user.cart_count, status: 200
    redirect_to product_path(params[:product_id])
  end

  def remove
    $redis.hincrby current_user_cart, params[:product_id], -1
    redirect_to cart_path(current_user.id)
  end

  private
  def current_user_cart
    "cart#{current_user.id}"
  end
end
