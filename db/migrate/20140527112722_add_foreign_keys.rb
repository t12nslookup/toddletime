class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL
      ALTER TABLE rota_leaders
        ADD CONSTRAINT fk_rota_leader_leader
        FOREIGN KEY (leader_id)
        REFERENCES leaders(id)
    SQL
    execute <<-SQL
      ALTER TABLE rota_leaders
        ADD CONSTRAINT fk_rota_leader_meet
        FOREIGN KEY (meet_id)
        REFERENCES meets(id)
    SQL
    execute <<-SQL
      ALTER TABLE rota_leaders
        ADD CONSTRAINT fk_rota_leader_job
        FOREIGN KEY (job_id)
        REFERENCES jobs(id)
    SQL

    execute <<-SQL
      ALTER TABLE child_to_meets
        ADD CONSTRAINT fk_child_to_meet_meet
        FOREIGN KEY (meet_id)
        REFERENCES meets(id)
    SQL
    execute <<-SQL
      ALTER TABLE child_to_meets
        ADD CONSTRAINT fk_child_to_meet_child
        FOREIGN KEY (child_id)
        REFERENCES children(id)
    SQL

    execute <<-SQL
      ALTER TABLE carer_to_children
        ADD CONSTRAINT fk_carer_to_child_carer
        FOREIGN KEY (carer_id)
        REFERENCES carers(id)
    SQL
    execute <<-SQL
      ALTER TABLE carer_to_children
        ADD CONSTRAINT fk_carer_to_child_child
        FOREIGN KEY (child_id)
        REFERENCES children(id)
    SQL
  end
end
