class ChangeNameTableCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_table :customers, :projects
  end
end
