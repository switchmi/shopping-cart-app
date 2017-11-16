class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    # @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Bros Site')
  end

  def order_complete(user)
    @user = user
    @orders = user.products
    mail(to: @user.email, subject: 'Congratulations! You order is complete!', from: 'bro@brobagz.com')
  end
end
