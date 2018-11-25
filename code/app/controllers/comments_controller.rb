# This file is the Controller for the Comments class
class CommentsController < ApplicationController

  def create
    # Create a new Comment
    @scam = Scam.find(params[:scam_id])
    @comment = @scam.comments.create(comment_params)

    @poster = User.find(@scam.user_id)
    # Send the original poster an email notification
    UserMailer.with(commenter: current_user, poster: @poster, comment: @comment).comment_notification.deliver_now

    redirect_to scam_path(@scam) # After submitting a comment, return to the scam report page
  end

  def destroy
    @scam = Scam.find(params[:scam_id])
    @comment = @scam.comments.find(params[:id])
    @comment.destroy
    redirect_to scam_path(@scam) # After deleting a comment, return to the scam report page
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end


end
