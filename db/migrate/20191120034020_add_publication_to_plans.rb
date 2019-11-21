class AddPublicationToPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :published, :boolean, default:true
  end
end
