class CreateCarerToChildren < ActiveRecord::Migration
  def change
    create_table :carer_to_children do |t|
      t.references :child, index: true
      t.references :carer, index: true
      t.string :relationship

      t.timestamps
    end
  end
end
