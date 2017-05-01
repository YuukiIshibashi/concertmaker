class AddColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :user_id, :integer
    add_column :events, :start, :date
    add_column :events, :end, :date
  end
end
