class AddMovieToPastEvents < ActiveRecord::Migration
  def change
    add_column :past_events, :movie, :string
  end
end
