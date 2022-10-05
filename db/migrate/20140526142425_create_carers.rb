# frozen_string_literal: true

class CreateCarers < ActiveRecord::Migration[5.2]
  def change
    create_table :carers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :can_contact

      t.timestamps
    end
  end
end
