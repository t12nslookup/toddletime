class CreateMeetTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :meet_types do |t|
      t.string :name
      t.integer :deleted, default: 0

      t.timestamps
    end
  end
end
