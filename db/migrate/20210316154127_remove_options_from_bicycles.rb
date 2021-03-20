class RemoveOptionsFromBicycles < ActiveRecord::Migration[6.1]
  def change
    remove_column :bicycles, :options, :json
  end
end
