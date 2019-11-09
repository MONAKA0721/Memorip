class AddDestinationableRefToDestinations < ActiveRecord::Migration[5.1]
  def change
    add_reference :destinations, :placeable, polymorphic: true
  end
end
