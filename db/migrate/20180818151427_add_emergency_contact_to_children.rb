class AddEmergencyContactToChildren < ActiveRecord::Migration
  def change
    add_column :children, :emergency_contact, :string
  end
end
