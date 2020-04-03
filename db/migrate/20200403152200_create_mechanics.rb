class CreateMechanics < ActiveRecord::Migration[5.1]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.integer :yrs_exp
    end
  end
end
