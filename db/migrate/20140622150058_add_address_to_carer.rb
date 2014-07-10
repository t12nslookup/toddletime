class AddAddressToCarer < ActiveRecord::Migration
  def change
    add_column :carers, :address, :string
    add_column :carers, :postcode, :string
  end
end
