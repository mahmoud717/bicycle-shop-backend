class CreateBicycles < ActiveRecord::Migration[6.1]
  def change
    create_table :bicycles do |t|
      t.string :name 
      t.string :model
      t.string :image_url
      t.timestamps
    end
  end
end
