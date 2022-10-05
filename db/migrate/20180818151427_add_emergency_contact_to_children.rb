# frozen_string_literal: true

class AddEmergencyContactToChildren < ActiveRecord::Migration[5.2]
  def change
    add_column :children, :emergency_contact, :string
  end
end
