class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :pid
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.integer :wrank
      t.integer :lrank
      t.string :hand
      t.string :dob
      t.string :country

      t.timestamps
    end
  end
end
