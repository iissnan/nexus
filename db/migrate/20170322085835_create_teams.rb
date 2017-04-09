class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name, default: ''
      t.string :sn1, index: true, null: false
      t.string :sn2, index: true
      t.integer :sn1_position
      t.integer :sn2_position
      t.timestamps
    end
  end
end
