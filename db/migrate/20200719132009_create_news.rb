class CreateNews < ActiveRecord::Migration[6.0]
  def self.up
    create_table :news do |t|
      t.column :title, :string, :limit => 255, :null => false
      t.column :infor, :text, :null=>false
      t.column :description, :text
      t.column :img, :string
      t.column :checked, :boolean, :default =>true
      
      t.belongs_to :user
      t.timestamps
    end
  end
  def self.down
    drop_table :news
  end