class AddQtyApplyToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :qty_apply, :int, :default=>0
  end
end
