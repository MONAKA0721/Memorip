class AddPictureToPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :picture, :string
  end
end
