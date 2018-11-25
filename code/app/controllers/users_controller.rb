# This file uses the has_friendship Gem to create friend request functionality
class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def add_friend
		@new_friend = User.find(params[:friend_id])
		current_user.friend_request(@new_friend) # friend_request() is a function from the has_friendship Gem
		redirect_to users_path # Return to the Friends page
	end

	def accept_friend
		@new_friend = User.find(params[:friend_id])
		current_user.accept_request(@new_friend) # accept_request() is a function from the has_friendship Gem
		redirect_to users_path # Return to the Friends page		
	end

	def remove_friend
		@friend = User.find(params[:friend_id])
		current_user.remove_friend(@friend) # remove_friend() is a function from the has_friendship Gem
		redirect_to users_path # Return to the Friends page			
	end
end