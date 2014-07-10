class AddDbsToLeader < ActiveRecord::Migration
  def change
    add_column :leaders, :dbs, :date
  end
end
