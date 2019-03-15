class UserMailer < ApplicationMailer
	default from: 'no-reply@catipic.com'
 
  def welcome_email(user , cart)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 
    @cart = cart

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'catipic.com' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'CatiPic !') 
  end
end
