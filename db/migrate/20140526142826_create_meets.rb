# frozen_string_literal: true

class CreateMeets < ActiveRecord::Migration[5.2]
  def change
    create_table :meets do |t|
      t.date :meet_date

      t.timestamps
    end
  end
end
