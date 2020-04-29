class CreateHowHeards < ActiveRecord::Migration[5.2]
  def change
    create_table :how_heards do |t|
      t.string :location_name
      t.integer :expired, default: 0

      t.timestamps
    end
  end
end
