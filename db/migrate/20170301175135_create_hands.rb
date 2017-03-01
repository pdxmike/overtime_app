class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.integer :hand_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
