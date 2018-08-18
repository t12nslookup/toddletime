class AddWhatContactToCarer < ActiveRecord::Migration
  def change
    add_reference :carers, :how_contact, index: true
    add_reference :carers, :what_contact, index: true
  end
end
