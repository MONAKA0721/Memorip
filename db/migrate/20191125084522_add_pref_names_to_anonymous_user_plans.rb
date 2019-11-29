class AddPrefNamesToAnonymousUserPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :anonymous_user_plans, :PrefNames, :string
  end
end
