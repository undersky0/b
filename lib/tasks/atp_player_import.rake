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
		Player.create(pid: row[PID], first_name: row[FIRST_NAME], last_name: row[LAST_NAME], 
			hand: row[HAND], dob:dob, country:row[COUNTRY])
	end
end

	DATE = 0
	RANK = 1
	PLAYED_ID = 2
	POINTS = 3

task :import_rank => :environment do 
	CSV.foreach("#{Rails.root}/lib/data/atp_rankings_current.csv", encoding:'iso-8859-1:utf-8') do |row|
		date = row[DATE].try(:to_date) rescue nil 
		Rank.create(ranking_date: date, pid: row[PLAYED_ID],
			ranking_points: row[POINTS], ranking:row[RANK])
	end
end