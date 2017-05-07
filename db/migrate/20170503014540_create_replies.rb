class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content
      t.integer :user_id
      t.integer :performer_id
      t.integer :request_id

      t.timestamps null: false
    end
  end
end
