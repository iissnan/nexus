class CreateTeamworks < ActiveRecord::Migration[5.0]
  def change
    create_table :teamworks do |t|
      t.belongs_to :team
      t.belongs_to :player
      t.timestamps
    end
  end
end
