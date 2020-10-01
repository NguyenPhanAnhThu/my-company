class AddViewsToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :views, :int, :default=>0
  end
end
