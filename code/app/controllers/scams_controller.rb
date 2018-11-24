class ScamsController < ApplicationController

    def index
        @scams = Scam.all
    end

	def new
		@scam = Scam.new
	end

    def show
        @scam = Scam.find(params[:id])
        @poster = User.find(@scam.user_id)
    end

    def edit
        @scam = Scam.find(params[:id])
    end

	def create
    	@scam = current_user.scams.create(scam_params)
    	redirect_to root_path
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
 
        redirect_to root_path
    end

    private
        def scam_params
            params.require(:scam).permit(:scam_type, :description)
        end


end