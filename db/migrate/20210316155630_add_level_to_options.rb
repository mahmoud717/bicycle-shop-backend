class AddLevelToOptions < ActiveRecord::Migration[6.1]
  def change
    add_column :options, :level, :integer, :default => 0
  end
end
