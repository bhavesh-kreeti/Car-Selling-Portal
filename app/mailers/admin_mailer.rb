class AdminMailer< ApplicationMailer
	def admin_mail(email,mes)
	
		mail(to: email, subject: " Your car status is #{mes}")
	end
end