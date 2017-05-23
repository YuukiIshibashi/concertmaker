class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.references :user, null: false
      t.references :performer, null: false
      t.string :uuid, null: false

      t.timestamps null: false
    end
  end
end
