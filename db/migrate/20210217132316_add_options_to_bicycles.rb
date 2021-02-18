class AddOptionsToBicycles < ActiveRecord::Migration[6.1]
  def change
    add_column :bicycles, :options, :string, array: true, default: []
  end
end
