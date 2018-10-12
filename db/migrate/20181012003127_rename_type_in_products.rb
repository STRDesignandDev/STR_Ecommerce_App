class RenameTypeInProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :birdtype, :string
  end
end
