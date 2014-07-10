class AddMeetTypeToMeet < ActiveRecord::Migration
  def change
    add_reference :meets, :meet_type, index: true
  end
end
