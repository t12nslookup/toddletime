class AddMoreForeignKeys < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL
      ALTER TABLE meets
        ADD CONSTRAINT fk_meet_to_meet_type
        FOREIGN KEY (meet_type_id)
        REFERENCES meet_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE carer_to_meets
        ADD CONSTRAINT fk_carer_to_meet_meet
        FOREIGN KEY (meet_id)
        REFERENCES meets(id)
    SQL
    execute <<-SQL
      ALTER TABLE carer_to_meets
        ADD CONSTRAINT fk_carer_to_meet_carer
        FOREIGN KEY (carer_id)
        REFERENCES carers(id)
    SQL
    execute <<-SQL
      ALTER TABLE meet_type_jobs
        ADD CONSTRAINT fk_meet_type_job_job
        FOREIGN KEY (job_id)
        REFERENCES jobs(id)
    SQL
    execute <<-SQL
      ALTER TABLE meet_type_jobs
        ADD CONSTRAINT fk_meet_type_job_meet_type
        FOREIGN KEY (meet_type_id)
        REFERENCES meet_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE leader_meet_types
        ADD CONSTRAINT fk_leader_meet_type_leader
        FOREIGN KEY (leader_id)
        REFERENCES leaders(id)
    SQL
    execute <<-SQL
      ALTER TABLE leader_meet_types
        ADD CONSTRAINT fk_leader_meet_type_meet_type
        FOREIGN KEY (meet_type_id)
        REFERENCES meet_types(id)
    SQL
  end
end
