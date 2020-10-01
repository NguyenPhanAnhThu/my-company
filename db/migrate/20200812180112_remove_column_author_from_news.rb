class RemoveColumnAuthorFromNews < ActiveRecord::Migration[6.0]
  def change
    remove_column :news, :author, :string, :limit => 100
  end
end
