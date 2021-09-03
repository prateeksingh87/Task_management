class UserMailer < ApplicationMailer
	def notify_user(user)
    @user = user
    mail(to: @user.email, subject: 'Your Task deadline Date is Going to be end')
  end
end
