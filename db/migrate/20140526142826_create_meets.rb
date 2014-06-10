class CreateMeets < ActiveRecord::Migration
  def change
    create_table :meets do |t|
      t.date :meet_date

      t.timestamps
    end
  end
end
