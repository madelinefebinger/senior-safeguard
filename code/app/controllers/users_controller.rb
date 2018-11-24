class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def add_friend
		@new_friend = User.find(params[:friend_id])
		current_user.friend_request(@new_friend)
		redirect_to users_path
	end

	def accept_friend
		@new_friend = User.find(params[:friend_id])
		current_user.accept_request(@new_friend)
		redirect_to users_path		
	end

	def remove_friend
		@friend = User.find(params[:friend_id])
		current_user.remove_friend(@friend)
		redirect_to users_path			
	end
end