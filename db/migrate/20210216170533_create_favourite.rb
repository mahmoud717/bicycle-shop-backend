class CreateFavourite < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.belongs_to :user
      t.belongs_to :bicycle
      t.timestamps
    end
  end
end
