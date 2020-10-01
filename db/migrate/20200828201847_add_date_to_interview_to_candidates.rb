class AddDateToInterviewToCandidates < ActiveRecord::Migration[6.0]
  def change
    add_column :candidates, :date_to_interview, :string
  end
end
