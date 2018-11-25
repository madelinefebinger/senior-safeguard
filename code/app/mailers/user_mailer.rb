class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'
 
 	def scam_report_notification
		@scam_reporter = params[:scam_reporter]
    	@friend  = params[:friend]
    	@scam = params[:scam]
    	mail(to: @friend.email, subject: 'Scam Report Notification')
  	end

 	def comment_notification
		@commenter = params[:commenter]
    	@poster  = params[:poster]
    	@comment = params[:comment]
    	mail(to: @poster.email, subject: 'Comment Notification')
  	end

end
