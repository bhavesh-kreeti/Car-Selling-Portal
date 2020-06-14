class SellerMailer < ApplicationMailer
	def car_sold(user)
		@user = user
		mail(to: @user.email, subject: 'Your car is sold')
	end
end
