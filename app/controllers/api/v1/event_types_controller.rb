module Api::V1
	class EventTypesController < ApiController
	include Betting

	def index 
		render json: Betting.list_competitions
	end

	def show
		p params
		render json: Betting.event_type(params[:id])
	end

	end
end
