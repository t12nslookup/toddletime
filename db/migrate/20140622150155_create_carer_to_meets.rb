class CreateCarerToMeets < ActiveRecord::Migration
  def change
    create_table :carer_to_meets do |t|
      t.references :carer, index: true
      t.references :meet, index: true

      t.timestamps
    end
  end
end
