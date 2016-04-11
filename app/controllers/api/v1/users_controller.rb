module Api::V1
  class UsersController < ApiController
  	#before_action :authenticate_v1_user!
    # GET /v1/users
    def index
      render json: User.all
    end

    def show
    	render json: User.first
    end

  end
end