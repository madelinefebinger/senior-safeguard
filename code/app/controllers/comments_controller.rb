# This file is the Controller for the Comments class
class CommentsController < ApplicationController

  def create
    @scam = Scam.find(params[:scam_id])
    @comment = @scam.comments.create(comment_params)
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
