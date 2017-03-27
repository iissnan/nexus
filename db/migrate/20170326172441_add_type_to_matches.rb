class AddTypeToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :type, :string
  end
end
