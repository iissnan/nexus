class UpdateTeams < ActiveRecord::Migration[5.0]
  def change
    remove_column :teams, :player1_id, :integer
    remove_column :teams, :player2_id, :integer
    remove_column :teams, :player1_position, :integer
    remove_column :teams, :player2_position, :integer
    add_column :teams, :sn1, :string
    change_column_null :teams, :sn1, false
    add_column :teams, :sn2, :string
    add_column :teams, :sn1_position, :integer
    add_column :teams, :sn2_position, :integer
  end
end
