class CreateAnonymousUserPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :anonymous_user_plans do |t|
      t.string :tiele
      t.string :picture

      t.timestamps
    end
  end
end
