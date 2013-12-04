class AddCompetitionIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :competition_id, :integer
  end
end
