class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.text :name
      t.time :time
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
