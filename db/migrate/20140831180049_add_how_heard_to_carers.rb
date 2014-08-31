class AddHowHeardToCarers < ActiveRecord::Migration
  def change
    add_reference :carers, :how_heard, index: true
    add_column :carers, :other_heard, :string
  end
end
