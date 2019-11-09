class RenameTitleColumnToAnonymousUserPlans < ActiveRecord::Migration[5.1]
  def change
    rename_column :anonymous_user_plans, :tiele, :title
  end
end
