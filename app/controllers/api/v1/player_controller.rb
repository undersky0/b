module Api::V1
	class PlayerController < ApiController


		def index 
			render json: User.all
		end

	end 
end
