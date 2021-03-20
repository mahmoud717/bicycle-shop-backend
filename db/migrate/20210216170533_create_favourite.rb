class CreateFavourite < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.references :user
      t.references :bicycle
      t.timestamps
    end
  end
end
