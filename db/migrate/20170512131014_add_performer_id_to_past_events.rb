class AddPerformerIdToPastEvents < ActiveRecord::Migration
  def change
    add_column :past_events, :performer_id, :integer
  end
end
