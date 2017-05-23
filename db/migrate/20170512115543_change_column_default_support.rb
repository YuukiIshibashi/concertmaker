class ChangeColumnDefaultSupport < ActiveRecord::Migration
  def change
    change_column_default :supports, :status, 0
  end
end
