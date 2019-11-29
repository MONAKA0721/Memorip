class RenamePrefNamesColumnToAnonymousUserPlans < ActiveRecord::Migration[5.1]
  def change
    rename_column :anonymous_user_plans, :PrefNames, :prefectures
  end
end
