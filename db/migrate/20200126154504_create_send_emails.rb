class CreateSendEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :send_emails do |t|
      t.string :addresses
      t.string :subject
      t.string :body
      t.references :meet_type, index: true, foreign_key: true, null: true
      t.integer :state, default: 0

      t.timestamps null: false
    end
  end
end
