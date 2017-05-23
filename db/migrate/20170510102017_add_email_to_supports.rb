class AddEmailToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :email, :string
  end
end
