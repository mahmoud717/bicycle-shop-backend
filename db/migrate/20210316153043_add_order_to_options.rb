class AddOrderToOptions < ActiveRecord::Migration[6.1]
  def change
    add_reference :options, :bicycle, index: true
  end
end
