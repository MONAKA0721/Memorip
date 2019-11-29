class AddDescriptionToDestinations < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :description, :text
  end
end
