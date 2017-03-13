class Point < ActiveRecord::Base

  belongs_to :player_1, primary_key: :id, foreign_key: :player_1_id, class_name: "Player"
  belongs_to :player_2, primary_key: :id, foreign_key: :player_2_id, class_name: "Player"
end
