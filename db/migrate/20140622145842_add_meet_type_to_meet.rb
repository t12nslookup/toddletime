# frozen_string_literal: true

class AddMeetTypeToMeet < ActiveRecord::Migration[5.2]
  def change
    add_reference :meets, :meet_type, index: true
  end
end
