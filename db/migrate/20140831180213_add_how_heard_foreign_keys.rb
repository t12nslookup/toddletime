class AddHowHeardForeignKeys < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL
      ALTER TABLE leader_to_meets
        ADD CONSTRAINT fk_leader_to_meet_meet
        FOREIGN KEY (meet_id)
        REFERENCES meets(id)
    SQL
    execute <<-SQL
      ALTER TABLE leader_to_meets
        ADD CONSTRAINT fk_leader_to_meet_leader
        FOREIGN KEY (leader_id)
        REFERENCES leaders(id)
    SQL
    execute <<-SQL
      ALTER TABLE carers
        ADD CONSTRAINT fk_carer_to_how_heard
        FOREIGN KEY (how_heard_id)
        REFERENCES how_heards(id)
    SQL
  end
end
