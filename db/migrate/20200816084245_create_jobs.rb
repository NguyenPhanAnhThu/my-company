class CreateJobs < ActiveRecord::Migration[6.0]
  def self.up
    create_table :jobs do |t|
      t.column :name, :string, :null=>false
      t.column :salary, :string
      t.column :expiration_date, :string
      t.column :contact, :string
      t.column :descriptions, :text
      t.column :benifits, :text
      t.column :experience, :text
      t.column :status, :boolean
      t.belongs_to :level
      t.belongs_to :type_of_job
      t.belongs_to :experience_level
      
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
