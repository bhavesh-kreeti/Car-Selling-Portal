class UserMailer < ActionMailer::Base

	default from: "noreply@dafaylt.com"

	def registration_confirmation (user)
		@user = user
		mail(to: @user.email , subject: 'Please confirm your email')
	end


end