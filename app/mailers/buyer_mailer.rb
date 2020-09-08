class BuyerMailer < ApplicationMailer
	def reject(user)
		@user = user
		mail(to: @user.email, subject: 'Car Buying Status rejected')
	end
	def approve(user)
	  @user = user
		mail(to: @user.email, subject: 'Car Buying Status Accepted')
	end
end
