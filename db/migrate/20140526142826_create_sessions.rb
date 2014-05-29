class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :session_date

      t.timestamps
    end
  end
end
