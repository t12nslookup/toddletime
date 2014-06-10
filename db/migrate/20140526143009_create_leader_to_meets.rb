class CreateLeaderToMeets < ActiveRecord::Migration
  def change
    create_table :leader_to_meets do |t|
      t.references :leader, index: true
      t.references :job, index: true
      t.references :meet, index: true
      t.boolean :expired

      t.timestamps
    end
    change_column_default :leader_to_meets, :expired, false
  end
end
