class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.text :display_name
      t.text :avatar
      t.integer :rating, default: 2000
      t.boolean :sn_fixed, default: false

      t.timestamps
    end
  end
end
