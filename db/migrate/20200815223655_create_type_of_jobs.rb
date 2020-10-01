class CreateTypeOfJobs < ActiveRecord::Migration[6.0]
  def self.up
    create_table :type_of_jobs do |t|
      t.column :name, :string, :null=>false
      t.timestamps
    end
  end
  
  def self.down
    drop_table :type_of_jobs
  end
end
