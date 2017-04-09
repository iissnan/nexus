class CreateSerialNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :serial_numbers do |t|
      t.string      :number, null: false
      t.belongs_to  :user
      t.timestamps
    end
  end
end
