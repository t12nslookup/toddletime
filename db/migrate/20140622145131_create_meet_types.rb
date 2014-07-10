class CreateMeetTypes < ActiveRecord::Migration
  def change
    create_table :meet_types do |t|
      t.string :name
      t.integer :deleted, default: 0

      t.timestamps
    end
  end
end
