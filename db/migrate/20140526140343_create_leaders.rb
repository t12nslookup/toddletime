class CreateLeaders < ActiveRecord::Migration[5.2]
  def change
    create_table :leaders do |t|
      t.string :name
      t.string :email
      t.date :expired

      t.timestamps
    end
  end
end
