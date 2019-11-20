class AddPictureToDestinations < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :picture, :string
  end
end
