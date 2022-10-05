# frozen_string_literal: true

class CreateWhatContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :what_contacts do |t|
      t.string :contact_type
      t.integer :expired, default: 0

      t.timestamps null: false
    end
  end
end
