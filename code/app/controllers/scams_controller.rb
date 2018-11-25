class ScamsController < ApplicationController

    def index
        @scams = Scam.all
    end

	def new
		@scam = Scam.new
	end

    def show
        @scam = Scam.find(params[:id])
        @poster = User.find(@scam.user_id) # Get the User who posted the scam report
    end

    def edit
        @scam = Scam.find(params[:id])
    end

	def create
    	@scam = current_user.scams.create(scam_params) # Create a new Scam report

        # Send an email notification to the current user's friends
        current_user.friends.each do |friend|
            UserMailer.with(scam_reporter: current_user, friend: friend, scam: @scam).scam_report_notification.deliver_now
        end

    	redirect_to root_path # After submitting a scam report, return to the home page
	end

    def update
        @scam = Scam.find(params[:id])
 
        if @scam.update(scam_params)
            redirect_to @scam
        else
            render 'edit'
        end
    end

    def destroy
        @scam = Scam.find(params[:id])
        @scam.destroy
 
        redirect_to root_path # After deleting a scam report, return to the home page
    end

    private
        def scam_params
            params.require(:scam).permit(:scam_type, :description)
        end


end