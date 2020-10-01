class CreateCandidates < ActiveRecord::Migration[6.0]
  def self.up
    create_table :candidates do |t|
      t.column :del_flag, :boolean, :default => false
      t.column :name, :string, :limit => 100
      t.column :email, :string
      t.column :phone, :string
      t.column :cv, :string
      t.column :note, :text
      t.column :is_passed, :boolean, :default => false
      t.column :status,  :integer, :default => 1
      t.belongs_to :job
      t.timestamps
    end
  end
  def self.down
    drop_table :candidates
  end
end
