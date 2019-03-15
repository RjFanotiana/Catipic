class HomesController < ApplicationController
  def index
   @items = Item.all 
   @cart = Cart.where(user:current_user).count
  end	
  
  def update
  	item = params[:id].to_i
    @cart = Cart.create(item_id:item,user:current_user)
  end	

  def show
    @cart_count = Cart.where(user:current_user).count
    @item = Item.find(params[:id])
    @items = Item.all
    @tab = []
    @items.each do |a|
      if a.id == params[:id]
      else
       @tab << a.id
     end
    end
    @randomize1 =@tab.sample
     @randomize2 =@tab.sample
      @randomize3 =@tab.sample
       @randomize4 =@tab.sample
  end

  def show_cart
    @cart = Cart.where(user:current_user)
    @cart_count = Cart.where(user:current_user).count

  end	
  def contact
  end
  def apropos
  end

  def stripe
  @user= User.find(current_user.id)   #ovana curent user
  @cart= Cart.where(user_id:current_user.id) #ovana le cmd




  
  # # Amount in cents
  # @amount = 500

  # customer = Stripe::Customer.create({
  #   email: params[:stripeEmail],
  #   source: params[:stripeToken],
  # })

  # charge = Stripe::Charge.create({
  #   customer: customer.id,
  #   amount: @amount,
  #   description: 'Rails Stripe customer',
  #   currency: 'usd',
  # })


UserMailer.welcome_email(@user, @cart).deliver_now  #################l action pour envoyer le mail
  @cart.each do |m|
    m.destroy
  end
rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end



end
