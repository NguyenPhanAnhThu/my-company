class CreateUsers < ActiveRecord::Migration[6.0]
  def self.up
    create_table :users do |t|
      t.column :username, :string, :limit => 32, :unique => true, :null =>false
      t.column :password, :string, :null => false
      t.column :fullname, :string, :null => false
      t.column :is_male, :boolean, :default => true
      t.column :birthday, :date
      t.column :email, :string, :limit => 100, :null => false
      t.column :address, :string, :limit =>250
      t.column :picture, :string
      t.column :phone, :string, :limit => 12, :null => false
      t.column :position, :string, :limit => 100, :null => false
      t.column :infor, :string, :limit => 500
      t.column :status, :boolean, :default => true
      t.column :created_by, :string, :null => true
      t.column :modified_by, :string, :null =>true
      t.timestamps
    end
  end
  def self.down
    drop_table :users
  end
end
