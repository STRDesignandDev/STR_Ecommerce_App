class AddBirdtypeToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :birdtype, :string
  end
end
