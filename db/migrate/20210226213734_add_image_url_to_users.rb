class AddImageUrlToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :image_url, :string
  end
end
