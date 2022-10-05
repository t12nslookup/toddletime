# frozen_string_literal: true

class AddDbsToLeader < ActiveRecord::Migration[5.2]
  def change
    add_column :leaders, :dbs, :date
  end
end
