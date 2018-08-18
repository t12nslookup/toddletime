class CreateHowContact < ActiveRecord::Migration
  def change
    create_table :how_contacts do |t|
      t.string :contact_type
      t.integer :expired, default: 0

      t.timestamps null: false
    end
  end
end
