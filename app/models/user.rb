class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :orders
  has_many :products, through: :orders

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def cart_total_price
    total_price = 0
    get_cart_products.each do |product|
      subtotal = product.price * ($redis.hget "cart#{id}",product.id).to_i
      total_price += subtotal
    end
    total_price
  end

  def get_cart_products
    cart_ids = $redis.hkeys current_user_cart
    Product.find(cart_ids)
  end

  def purchase_cart_products!
    get_cart_products.each do |product|
      quantity = $redis.hget current_user_cart, product.id
      purchase(product, quantity)
    end
    $redis.del "cart#{id}"
  end

  def purchase(product, quantity)
    stock = product.stock
    quantity.to_i.times do
      products << product
      stock -= 1
    end
    product.update(stock: stock)
  end

  def purchase?(product)
    products.include?(product)
  end


  after_create :send_mail
  def send_mail
    UserMailer.welcome_email(self).deliver
  end

  def cart_count
    $redis.hlen "cart#{id}"
  end

  private

  def current_user_cart
    "cart#{id}"
  end

end
