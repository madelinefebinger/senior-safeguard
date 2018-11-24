class HomeController < ApplicationController
	def index
		#Get all users for searching purposes
		@users = User.all

		# Find all scams reported by friends
		@friend_scams = Array.new

		current_user.friends.each do |friend|
			friend.scams.each do |scam|
				@friend_scams.push(scam)
			end
		end

		# Sort @friend_scams by most recent
		@friend_scams.sort_by { |scam| [scam.created_at] }


		# Sort all scam reports by most recent
		@sorted_scams = Scam.all

		@sorted_scams.sort_by { |scam| [scam.created_at] }
	end
end