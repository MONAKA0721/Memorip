class AddUserRefFromPlans < ActiveRecord::Migration[5.1]
  def change
    add_reference :plans, :user, foreign_key: true
    add_index :plans, [:user_id, :created_at]
  end
end
