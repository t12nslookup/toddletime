class AddForeignKeys < ActiveRecord::Migration
  def change
    execute <<-SQL
      ALTER TABLE leader_to_sessions
        ADD CONSTRAINT fk_leader_to_session_leader
        FOREIGN KEY (leader_id)
        REFERENCES leaders(id)
    SQL
    execute <<-SQL
      ALTER TABLE leader_to_sessions
        ADD CONSTRAINT fk_leader_to_session_session
        FOREIGN KEY (session_id)
        REFERENCES sessions(id)
    SQL
    execute <<-SQL
      ALTER TABLE leader_to_sessions
        ADD CONSTRAINT fk_leader_to_session_job
        FOREIGN KEY (job_id)
        REFERENCES jobs(id)
    SQL

    execute <<-SQL
      ALTER TABLE child_to_sessions
        ADD CONSTRAINT fk_child_to_session_session
        FOREIGN KEY (session_id)
        REFERENCES sessions(id)
    SQL
    execute <<-SQL
      ALTER TABLE child_to_sessions
        ADD CONSTRAINT fk_child_to_session_child
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
