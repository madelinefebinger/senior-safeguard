class HomeController < ApplicationController
	def index
		#Get all users for searching purposes in home/index.html.erb
		@users = User.all

		# Sort all scam reports by most recent
		@sorted_scams = Scam.order('created_at DESC')

		# Find all scams reported by friends
		@friend_scams = Array.new

		current_user.friends.each do |friend|
			friend.scams.each do |scam|
				@friend_scams.push(scam)
			end
		end

	end
end