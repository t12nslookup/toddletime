class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.string :gender
      t.date :date_of_birth
      t.string :address
      t.string :postcode
      t.string :medical_conditions
      t.string :special_needs
      t.date :registered_date

      t.timestamps
    end
  end
end
