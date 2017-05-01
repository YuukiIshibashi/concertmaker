class CreateJenres < ActiveRecord::Migration
  def change
    create_table :jenres do |t|
      t.string   "name"

      t.timestamps null: false
    end
  end
end
