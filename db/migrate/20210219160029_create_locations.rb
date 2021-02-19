class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :lon
      t.string :lat
      t.datetime :reported_at

      t.timestamps
    end
  end
end
