class CreateLevels < ActiveRecord::Migration[6.0]
  def self.up
    create_table :levels do |t|
      t.column :name, :string, :null=>false
      t.timestamps
    end
  end
  def self.down
    drop_table :levels
  end
end
