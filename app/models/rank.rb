class Rank < ApplicationRecord
  belongs_to :player, foreign_key: :pid, primary_key: :pid
end
