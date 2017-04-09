class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.belongs_to :serial_number
      t.belongs_to :team
      t.timestamps
    end
  end
end
