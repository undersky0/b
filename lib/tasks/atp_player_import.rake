require 'CSV'

desc "ATP player import task"

task :import_atp_players => :environment do
	PID = 0
	FIRST_NAME = 1
	LAST_NAME = 2
	HAND = 3
	DOB = 4
	COUNTRY = 5

	CSV.foreach("#{Rails.root}/lib/data/atp_players.csv", encoding:'iso-8859-1:utf-8') do |row|
		dob = row[DOB].try(:to_date) rescue nil 
		next if row[FIRST_NAME].nil?
		next if row[LAST_NAME].nil?
		Player.create(pid: row[PID], first_name: row[FIRST_NAME].encode('utf-8', 'binary', invalid: :replace, undef: :replace, replace: ''), last_name: row[LAST_NAME].encode('utf-8', 'binary', invalid: :replace, undef: :replace, replace: ''), 
			hand: row[HAND], dob:dob, country:row[COUNTRY])
	end
end



task :import_rank => :environment do 
	DATE = 0
	RANK = 1
	PLAYED_ID = 2
	POINTS = 3
	CSV.foreach("#{Rails.root}/lib/data/atp_rankings_current.csv", encoding:'iso-8859-1:utf-8') do |row|
		date = row[DATE].try(:to_date) rescue nil 
		Rank.create(ranking_date: date, pid: row[PLAYED_ID],
			ranking_points: row[POINTS], ranking:row[RANK])
	end
end

task :match_overview => :environment do
lost = []


#20120219-M-Rotterdam-F-Roger_Federer-Juan_Martin_Del_Potro,2,2,29,4,0,17,12,12,7,3,2,39,14,9,3,1,12,8,4
# match_id,player,set,serve_pts,aces,dfs,first_in,first_won,second_in,second_won,bk_pts,bp_saved,return_pts,
# return_pts_won,winners,winners_fh,winners_bh,unforced,unforced_fh,unforced_bh
# 19751219-M-Davis_Cup_World_Group_F-RR-Bjorn_Borg-Jiri_Hrebec,1,Total,69,2,1,32,25,37,21,5,4,63,36,28,10,16,16,6,9
# 19751219-M-Davis_Cup_World_Group_F-RR-Bjorn_Borg-Jiri_Hrebec,2,Total,63,2,2,41,20,22,7,12,4,69,23,14,8,4,26,15,9
CSV.foreach("#{Rails.root}/match_data/tennis_MatchChartingProject/charting-m-stats-Overview.csv", encoding:'iso-8859-1:utf-8') do |row|
	full_name_1 = row[ID].gsub("-", " ").split(" ").last(2).first.gsub("_", " ")
	full_name_2 = row[ID].gsub("-", " ").split(" ").last.gsub("_", " ")
	player_1 = Player.where("full_name LIKE ?", "%#{full_name_1}%").first.try(:id)
	player_2 = Player.where("full_name LIKE ?", "%#{full_name_2}%").first.try(:id)
	if player_1.nil? || player_2.nil?
		lost << row[ID]
		next
	end
	date = row[ID].delete(" ").first(8).to_date.to_s
	Overview.create(
		date: date,
		match_id: row[ID],
		player:  row[1],
		player_id: row[1] == 1 ? player_1 : player_2,
		set: row[2],
		serve_pts: row[3],
		aces: row[4],
		dfs: row[5],
		first_in: row[6],
		first_won: row[7],
		second_in: row[8],
		second_won: row[9],
		bk_pts: row[10],
		bp_saved: row[11],
		return_pts: row[12],
		return_pts_won: row[13],
		winners: row[14],
		winners_fh: row[15],
		winners_bh: row[16],
		unforced: row[17],
		unforced_fh: row[18],
		unforced_bh: row[19]
		)
end
end

task :import_matches => :environment do
# match_id,Player 1,Player 2,Pl 1 hand,Pl 2 hand,Gender,Date,Tournament,Round,Time,Court,Surface,Umpire,Best of,Final TB?,Charted by
# 20160404-M-Marrakech-R32-Facundo_Bagnis-Lamine_Ouahab,Facundo Bagnis,Lamine Ouahab,L,R,M,20160404,Marrakech,R32,,Center,Clay,Arnaud Gabas,3,1,jeffsackmann
# 20160403-M-Miami_Masters-F-Novak_Djokovic-Kei_Nishikori,Novak Djokovic,Kei Nishikori,R,R,M,20160403,Miami Masters,F,,Stadium,Hard,,3,1,Isaac
lost = []
CSV.foreach("#{Rails.root}/match_data/tennis_MatchChartingProject/charting-m-matches.csv", encoding:'iso-8859-1:utf-8') do |row|
	ID = 0
	next if row[1] == "Player 1"
	full_name_1 = row[ID].gsub("-", " ").split(" ").last(2).first.gsub("_", " ")
	full_name_2 = row[ID].gsub("-", " ").split(" ").last.gsub("_", " ")
	player_1 = Player.where("full_name LIKE ?", "%#{row[1]}%").first
	player_2 = Player.where("full_name LIKE ?", "%#{row[2]}%").first
	if player_1.nil? || player_2.nil?
		lost << row[ID]
		next
	end
	Match.find_or_create_by(
		date: row[6].to_date.to_s,
		match_id: row[ID].to_s,
		player_1: row[1],
		player_2: row[2],
		player_1_id: player_1.id,
		player_2_id: player_2.id,
		tournament: row[7],
		round:row[8],
		time: row[9],
		court: row[10],
		surface: row[11],
		umpire: row[12],
		best_of: row[13],
		final_tb: row[14]
				)
end
end

