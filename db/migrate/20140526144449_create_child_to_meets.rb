class CreateChildToMeets < ActiveRecord::Migration
  def change
    create_table :child_to_meets do |t|
      t.references :child, index: true
      t.references :meet, index: true

      t.timestamps
    end
  end
end
