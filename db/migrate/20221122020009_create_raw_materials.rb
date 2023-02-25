class CreateRawMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :raw_materials do |t|
      t.string :product_name
      t.string :product_type
      t.float :volume_solid
      t.float :weight_solid
      t.float :volatile_organic_compound
      t.float :pigment_volume_concentration
      t.float :density
      t.float :price

      t.timestamps
    end
  end
end
