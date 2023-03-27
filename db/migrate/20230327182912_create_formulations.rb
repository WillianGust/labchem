class CreateFormulations < ActiveRecord::Migration[7.0]
  def change
    create_table :formulations do |t|
      t.string :product_name
      t.text :description

      t.timestamps
    end
  end
end
