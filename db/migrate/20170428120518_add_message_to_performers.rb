class AddMessageToPerformers < ActiveRecord::Migration
  def change
    add_column :performers, :message, :string
  end
end
