class CreateLeaderToSessions < ActiveRecord::Migration
  def change
    create_table :leader_to_sessions do |t|
      t.references :leader, index: true
      t.references :job, index: true
      t.references :session, index: true
      t.boolean :expired

      t.timestamps
    end
    change_column_default :leader_to_sessions, :expired, false
  end
end
