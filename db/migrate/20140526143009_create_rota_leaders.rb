class CreateRotaLeaders < ActiveRecord::Migration[5.2]
  def change
    create_table :rota_leaders do |t|
      t.references :leader, index: true
      t.references :job, index: true
      t.references :meet, index: true
      t.boolean :expired

      t.timestamps
    end
    change_column_default :rota_leaders, :expired, false
  end
end
