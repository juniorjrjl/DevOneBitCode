class NotifyEndPremiumMailer < ApplicationMailer
	default from: 'dev@onebitcode.com'
	def notify
		@user = params[:user]
		@email = params[:email]
		@portfolio = params[:portfolio]

		mail(
	  		to: @user,
	  		subject: 'Seu premium vai acabar em 3 dias',
	  		reply_to: @email
		)
	end
end
