class AddPlayerToPointReferences < ActiveRecord::Migration
  def change
    add_reference :points, :player_1_id, index: true
    add_reference :points, :player_2_id, index: true
  end
end
