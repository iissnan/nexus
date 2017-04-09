class CreateFights < ActiveRecord::Migration[5.0]
  def change
    create_table :fights do |t|
      t.belongs_to :match
      t.belongs_to :team
      t.timestamps
    end
  end
end
