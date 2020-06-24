class CreateSendTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :send_texts do |t|
      t.string :addresses
      t.string :message
      t.references :meet_type, index: true, foreign_key: true, null: true
      t.integer :state, default: 0, index: true
      t.datetime :delivered_at

      t.timestamps null: false
    end
  end
end
