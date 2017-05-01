class CreateCandidacies < ActiveRecord::Migration
  def change
    create_table :candidacies do |t|
      t.integer :event_id
      t.integer :performer_id

      t.timestamps null: false
    end
  end
end
