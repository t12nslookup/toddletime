class CreateCarers < ActiveRecord::Migration
  def change
    create_table :carers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :can_contact

      t.timestamps
    end
  end
end
