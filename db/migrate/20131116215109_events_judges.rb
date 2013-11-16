class EventsJudges < ActiveRecord::Migration
  def change
    create_table :events_judges do |t|
      t.belongs_to :event
      t.belongs_to :judge
    end
  end
end
