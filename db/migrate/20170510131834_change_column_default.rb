class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column_default :performers, :support, 0
  end
end
