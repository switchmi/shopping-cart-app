class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :add_session_cart!
  before_action :check_cart!

  def new
    gon.client_token = generate_client_token
  end

  def create

    @result = Braintree::Transaction.sale(
              amount: current_user.cart_total_price,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      current_user.purchase_cart_products!
      UserMailer.order_complete(current_user).deliver_later
      redirect_to root_path, notice: "Congratulations! Your transaction is successful!"
    else
      flash[:alert] = @result.errors
      gon.client_token = generate_client_token
      render :new
    end
  end

  private

  def generate_client_token
    Braintree::ClientToken.generate
  end

  def check_cart!
    if current_user.get_cart_products.blank?
      redirect_to cart_path(current_user.id), alert: "Please add some items to your cart before processing your transaction!"
    end
  end

  def add_session_cart!
    cart_ids = session["cart"].keys
    cart_ids.each do |cart_id|
      quantity = session["cart"][cart_id]
      if $redis.hexists current_user_cart, cart_id
        quantity.times do
          $redis.hincrby current_user_cart, cart_id, 1
        end
      else
        $redis.hset current_user_cart, cart_id, 1
        (quantity-1).times do
          $redis.hincrby current_user_cart, cart_id, 1
        end
      end
    end
    session[:cart] = {}
  end

  def current_user_cart
    "cart#{current_user.id}"
  end
end
