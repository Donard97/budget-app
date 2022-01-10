class CreateJoinTableCategoriesPayment < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :payments do |t|
      t.index [:group_id, :payment_id]
    end
  end
end
