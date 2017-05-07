class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :content
      t.integer :user_id
      t.integer :performer_id
      t.timestamps null: false
    end
  end
end
