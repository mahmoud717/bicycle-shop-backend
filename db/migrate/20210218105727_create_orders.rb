class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references(:user)
      t.references(:bicycle)  
      t.string :product_name 
      t.string :product_image_url
      t.string :options , array: true, default: []
      t.timestamps
    end
  end
end
