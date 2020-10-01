class InsertValueToTypeOfJob < ActiveRecord::Migration[6.0]
  def self.up
      connection.execute <<-SQL
        INSERT INTO type_of_jobs (name, created_at, updated_at)
        VALUES ('Fulltime', NOW(), NOW()),
               ('Partime', NOW(), NOW())
      SQL
  end

  def self.down
  end
end
