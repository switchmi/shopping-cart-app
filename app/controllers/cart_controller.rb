class CartController < ApplicationController
  def show
    if current_user
      cart_ids = $redis.hkeys current_user_cart
    else
      init_session_cart
      cart_ids = session[:cart].keys
    end
    @products = Product.find(cart_ids)
  end

  def add
    if current_user
      cart_ids = $redis.hkeys current_user_cart
      @products = Product.find(cart_ids)
      if $redis.hexists current_user_cart, params[:product_id]
        $redis.hincrby current_user_cart, params[:product_id], 1
      else
        $redis.hset current_user_cart, params[:product_id], 1
      end
    else
      cart_ids = session["cart"].keys
      @products = Product.find(cart_ids)
      init_session_cart
      if session["cart"][params[:product_id]]
        session["cart"][params[:product_id]] += 1
      else
        session["cart"][params[:product_id]] = 1
      end
    end
    respond_to do |format|
      format.html {redirect_to product_path(params[:product_id]), alert: "Awesome! Item has been successfully added to cart!"}
      format.js
    end
  end

  def remove
    if current_user
      cart_ids = $redis.hkeys current_user_cart
      @products = Product.find(cart_ids)
      quantity = $redis.hget current_user_cart, params[:product_id]
      if quantity.to_i == 1
        $redis.hdel current_user_cart, params[:product_id]
      else
        $redis.hincrby current_user_cart, params[:product_id], -1
      end
    else
      cart_ids = session["cart"].keys
      @products = Product.find(cart_ids)
      quantity = session['cart'][params[:product_id]]
      if quantity == 1
        session["cart"].delete(params[:product_id])
      else
        session["cart"][params[:product_id]] -= 1
      end
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

  def init_session_cart
    unless session[:cart]
      session[:cart] = {}
    end
  end
end
