class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.references :match
      t.references :team
      t.integer :score
      t.datetime :at
      t.timestamps
    end
  end
end
