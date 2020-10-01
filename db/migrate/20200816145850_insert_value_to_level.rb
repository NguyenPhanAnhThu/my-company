class InsertValueToLevel < ActiveRecord::Migration[6.0]
  def self.up
    connection.execute <<-SQL
      INSERT INTO levels (name, created_at, updated_at)
      VALUES ('Fresher', NOW(), NOW()),
             ('Senior', NOW(), NOW()),
             ('Junior', NOW(), NOW())
    SQL
  end

  def self.down
  end
end
