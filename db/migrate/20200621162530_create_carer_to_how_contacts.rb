# frozen_string_literal: true

class CreateCarerToHowContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :carer_to_how_contacts do |t|
      t.references :carer, index: true, foreign_key: true, null: false
      t.references :how_contact, index: true, foreign_key: true, null: false
      t.integer :expired, index: true, null: false, default: 0

      t.timestamps
    end
  end
end
