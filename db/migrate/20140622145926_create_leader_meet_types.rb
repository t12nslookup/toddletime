# frozen_string_literal: true

class CreateLeaderMeetTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :leader_meet_types do |t|
      t.references :leader, index: true
      t.references :meet_type, index: true
      t.integer :expired, default: 0

      t.timestamps
    end
  end
end
