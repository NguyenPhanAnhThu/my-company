class CreateAbouts < ActiveRecord::Migration[6.0]
  def self.up
    create_table :abouts do |t|
      t.column :title, :string, :null => false
      t.column :logo, :string, :limit => 100
      t.column :favicon, :string, :limit => 100
      t.column :content, :text
      t.column :address, :string, :limit => 200
      t.column :hotline, :string, :limit => 12
      t.column :email, :string, :limit => 50
      t.column :facebook, :text
      t.column :linkedin, :text
      t.timestamps
    end
  end
  def self.down
    drop_table :abouts
  end
end
