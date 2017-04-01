class UpdateMatchType < ActiveRecord::Migration[5.0]
  def change
    change_column_default :players, :rating, from: 1000, to: 2000
    rename_column :matches, :type, :match_type
  end
end
