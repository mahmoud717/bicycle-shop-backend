class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :name
      t.string :value
      t.references :parent , default: :nil
      t.timestamps
    end
  end
end
