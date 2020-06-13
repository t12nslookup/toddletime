class AddHowContactForeignKeys < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL
      ALTER TABLE carers
        ADD CONSTRAINT fk_carer_to_how_contact
        FOREIGN KEY (how_contact_id)
        REFERENCES how_contacts(id)
    SQL
    execute <<-SQL
      ALTER TABLE carers
        ADD CONSTRAINT fk_carer_to_what_contact
        FOREIGN KEY (what_contact_id)
        REFERENCES what_contacts(id)
    SQL
  end
end
