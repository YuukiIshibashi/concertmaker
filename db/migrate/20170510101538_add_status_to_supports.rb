class AddStatusToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :status, :integer, default: [0]
  end
end
