# frozen_string_literal: true

class AddApprovedToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :approved, :boolean, default: false, null: false
    add_index  :users, :approved
  end
end
