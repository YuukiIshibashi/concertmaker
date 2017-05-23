class AddContentToPerformers < ActiveRecord::Migration
  def change
    add_column :performers, :content, :text
  end
end
