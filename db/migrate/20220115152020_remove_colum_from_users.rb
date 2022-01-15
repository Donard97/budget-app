class RemoveColumFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :surname
  end
end
