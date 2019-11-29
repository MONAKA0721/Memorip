class AddPrefecturesToPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :prefectures, :string
  end
end
