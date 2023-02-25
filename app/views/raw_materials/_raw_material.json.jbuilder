json.extract! raw_material, :id, :product_name, :product_type, :volume_solid, :weight_solid, :volatile_organic_compound, :pigment_volume_concentration, :density, :price, :created_at, :updated_at
json.url raw_material_url(raw_material, format: :json)
