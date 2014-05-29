class CreateChildToSessions < ActiveRecord::Migration
  def change
    create_table :child_to_sessions do |t|
      t.references :child, index: true
      t.references :session, index: true

      t.timestamps
    end
  end
end
