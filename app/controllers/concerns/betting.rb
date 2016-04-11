module Betting
#https://github.com/alterego-labs/betfair_api_ng_rails/wiki/Simple-listing-filtered-requests
#https://api.developer.betfair.com/services/webapps/docs/display/1smk3cen4v3lu3yomq5qye0ni/Betting+Operations
#http://diybetfairbots.lefora.com/
#http://forum.bdp.betfair.com/forumdisplay.php?f=28

class << self

	def list_competitions(id=[])
		connection.request "listCompetitions", {filter:BetfairApiNgRails::MarketFilter.new(event_type_ids:id),locale: :en}
	end

	def event_types
		# {"market_count"=>6, "event_type"=>{"id"=>"468328", "name"=>"Handball"}}
		event_types = BetfairApiNgRails.list_event_types(filter: BetfairApiNgRails::MarketFilter.new, locale: :en).to_json
		JSON.parse(event_types)
	end

	def event_type(id)
		filter = BetfairApiNgRails::MarketFilter.new event_type_ids: [1]
		event_types = BetfairApiNgRails.list_event_types(filter: filter, locale: :en).to_json
		JSON.parse event_types
	end

	protected

	def connection
		BetfairApiNgRails::Api::Connection.new(BetfairApiNgRails.account_manager)
	end

end

end