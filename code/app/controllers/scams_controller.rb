class ScamsController < ApplicationController

	def new
		@scam = Scam.new
	end

	def create
    	@scam = current_user.scams.create(scam_params)
    	redirect_to root_path
	end

    private
        def scam_params
            params.require(:scam).permit(:type, :description)
        end


end