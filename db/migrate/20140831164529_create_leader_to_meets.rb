class CreateLeaderToMeets < ActiveRecord::Migration[5.2]
  def change
    create_table :leader_to_meets do |t|
      t.references :meet, index: true
      t.references :leader, index: true

      t.timestamps
    end
  end
end
