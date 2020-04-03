class CreateMechanicRides < ActiveRecord::Migration[5.1]
  def change
    create_table :mechanic_rides do |t|
      t.references :ride, foreign_key: true
      t.refernces :mechanic
    end
  end
end
