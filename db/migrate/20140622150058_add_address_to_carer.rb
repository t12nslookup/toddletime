class AddAddressToCarer < ActiveRecord::Migration[5.2]
  def change
    add_column :carers, :address, :string
    add_column :carers, :postcode, :string
  end
end
