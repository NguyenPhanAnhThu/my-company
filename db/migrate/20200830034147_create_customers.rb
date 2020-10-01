class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :img
      t.string :link

      t.timestamps
    end
  end
end
