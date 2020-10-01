class AddDateToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :date_to_offer, :string
  end
end
